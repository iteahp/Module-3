public class News {
    private  String id;
    private String img;
    private  String tittle;
    private  String content;

    public News(String id,String img, String tittle, String content) {
        this.id = id;
        this.img = img;
        this.tittle = tittle;
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
