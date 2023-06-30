#include <opencv2/opencv.hpp>
#include <vector>
#include <string>
#include <nlohmann/json.hpp>
#include <fstream>

int main()
{
    // Define the chessboard size and square size

    std::ifstream config("../config.json");
    nlohmann::json vars;
    config >> vars;
    config.close();


    int chessboard_width = vars["chessboard_width"];
    int chessboard_height = vars["chessboard_height"];

    int chessboard_square_size = vars["chessboard_square_size"];

    std::string img_folder_path = vars["img_folder_path"];

    std::string output_file_name = vars["output_file_name"];
    std::string output_file_path = vars["output_file_path"];


    cv::Size boardSize(chessboard_width, chessboard_height);
    float squareSize = chessboard_square_size;

    // Create a vector of image file names
    std::vector<cv::String> imageFilenames;
    std::string folderPath = img_folder_path;
    cv::glob(folderPath + "*.jpg", imageFilenames);

    // Create a vector of image points and object points
    std::vector<std::vector<cv::Point2f>> imagePoints;
    std::vector<std::vector<cv::Point3f>> objectPoints;

    // Create the object points
    std::vector<cv::Point3f> corners;
    for (int i = 0; i < boardSize.height; i++) {
        for (int j = 0; j < boardSize.width; j++) {
            corners.push_back(cv::Point3f(j * squareSize, i * squareSize, 0));
        }
    }

    // Process each image
    for (int i = 0; i < imageFilenames.size(); i++) {
        // Load the image
        cv::Mat image = cv::imread(imageFilenames[i]);

        // Find the chessboard corners
        std::vector<cv::Point2f> corners2D;
        bool found = cv::findChessboardCorners(image, boardSize, corners2D);

        // show the frames with the grid drawn
        cv::drawChessboardCorners(image, boardSize, corners2D, found);
        cv::imshow("frame", image);
        cv::waitKey(5);

        // If corners are found, add the points to the vector
        if (found) {
          imagePoints.push_back(corners2D);
          objectPoints.push_back(std::vector<cv::Point3f>(corners.begin(), corners.end()));
        }
    }

    // kill imshow
    cv::destroyWindow("frame");
 
    // Get the size of the first image
    cv::Mat firstImage = cv::imread(imageFilenames[0]);
    cv::Size imageSize = firstImage.size();

    // Create the camera matrix and distortion coefficients
    cv::Mat cameraMatrix, distCoeffs;
    std::cout<< std::endl << "calculating calibration:" << std::endl;
    cv::calibrateCamera(objectPoints, imagePoints, imageSize, cameraMatrix, distCoeffs, cv::noArray(), cv::noArray());

    // Save the camera matrix and distortion coefficients to a YAML file
    cv::FileStorage fs("" +output_file_path + output_file_name+".yaml", cv::FileStorage::WRITE);
    fs << "image_width" << imageSize.width;
    fs << "image_height" << imageSize.height;
    fs << "camera_matrix" << cameraMatrix;
    fs << "distortion_coefficients" << distCoeffs;
    fs.release();

    return 0;
}