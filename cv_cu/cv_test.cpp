#include <iostream>
#include "opencv2/cudaarithm.hpp"
#include "opencv2/highgui.hpp"

int main()
{
    cv::Mat h_img1, h_result;
    h_img1 = cv::imread("../images/liu.jpeg");
    
    cv::cuda::GpuMat d_img1, d_result;
    d_img1.upload(h_img1);
    cv::cuda::threshold(d_img1, d_result, 128, 255, 0);
    
    d_result.download(h_result);
    cv::imwrite("../images/liu_thr.jpg", h_result);

    return 0;
}