import java.util.ArrayList;
import java.util.List;

public class NewService {
 static    List<News> news = new ArrayList<>();
    static {
        news.add(new News("1","https://vnn-imgs-f.vgcloud.vn/2021/12/23/11/tin-chung-khoan-ngay-23-12-doanh-nghiep-sach-no-con-dai-gia-kiem-trieu-usd-240x160.jpg","Chuyện nhà đại gia Việt: Cha dần sạch nợ nần, con âm thầm kiếm triệu USD","Một số DN tái cấu"));
        news.add(new News("2","https://vnn-imgs-f.vgcloud.vn/2021/12/22/21/gia-vang-hom-nay-23-12-vang-chiu-ap-luc-lon-240x160.jpg","Giá vàng hôm nay 23/12: Áp lực lớn, giá khó lường","Giá vàng hôm nay 23/12: Áp lực lớn, giá khó lường\n" + "Giá vàng hôm nay 23/12 trên thị trường quốc tế chịu áp lực lớn trước ngưỡng 1.800 USD/ounce cho dù nền kinh tế Mỹ tăng trưởng vượt kỳ vọng trong quý III."));
        news.add(new News("3","https://vnn-imgs-a1.vgcloud.vn/icdn.dantri.com.vn/zoom/1200_630/2021/12/23/vua-tien-mat-crop-crop-crop-1640229451701-240x160.jpeg","Sốt đất diễn ra, chuyên gia vạch điểm cốt yếu dân 'lướt sóng' cần lưu ý","Theo chuyên gia, nếu rủi ro có xảy ra thì tính thanh khoản của sản phẩm sẽ đáng lo hơn là giá trị bị rớt giá bởi vì những sản phẩm không phù hợp với nhu cầu của đại bộ phận người dân."));

    }

    List<News> findAll(){
        return  news;
    }
}
