package com.semifinal.vancouvercrime;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RFileInputStream;
import org.rosuda.REngine.Rserve.RserveException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.semifinal.vancouvercrime.dao.IDao;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
//	@Autowired
//	public R EXP rx = null;
//	
	public REXP rx =null;
	public RConnection rCon = null;
	public String rStr = "";
	
	public HomeController() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/machineinput")
	public String list(Model model) {
		//IDao dao = sqlSession.getMapper(IDao.class);
		//model.addAttribute("list",dao.listDao());
		
		//public REX
		return "machineinput";
	}
	
	
	@RequestMapping("/result_map")
	public String result_map(Model model) {
		
		return "result_map";
	}
	
	@RequestMapping("/boot")
	public String boot(Model model) {
		
		return "test";
	}
	
	
	
	@RequestMapping("machine")
	public String getinput(int TYPE, int YEAR, int MONTH, int DAY, int HOUR, int NEIGHBOURHOOD, int Weather, double Temp, int Rel_Hum 
			) throws RserveException, REXPMismatchException{
		//public String map();
		rCon = new RConnection();
		//rCon.eval("print("+TYPE+")");
		System.out.println(TYPE+YEAR);
		rCon.eval("load('C:/Users/KJW/Desktop/KJW/BigData/semiproject/last_model.dat')");
		System.out.println("실패인것인가??");
		int TYPE_input = TYPE;
		int YEAR_input = YEAR;
		int MONTH_input = MONTH;
		int DAY_input = DAY;
		int HOUR_input = HOUR;
		int NEIGHBOURHOOD_input = NEIGHBOURHOOD;
		int Weather_input = Weather;
		double Temp_input = Temp;
		int Rel_Hum_input = Rel_Hum;
//		rCon.eval("TYPE_input<-"+TYPE_input+"YEAR_input<-"+YEAR_input+"MONTH_input<-"+MONTH_input+"DAY_input<-"+DAY_input+
//				"HOUR_input<-"+HOUR_input+"NEIGHBOURHOOD_input<-"+NEIGHBOURHOOD_input+"Weather_input<-"+Weather_input+
//				"Temp_input<-"+Temp_input+"Rel_Hum_input<-"+Rel_Hum_input);


		
		rCon.eval("TYPE_input<-"+TYPE_input+";YEAR_input<-"+YEAR_input+";MONTH_input<-"+MONTH_input+";DAY_input<-"+DAY_input+
				";HOUR_input<-"+HOUR_input+";NEIGHBOURHOOD_input<-"+NEIGHBOURHOOD_input+";Weather_input<-"+Weather_input+
				";Temp_input<-"+Temp_input+";Rel_Hum_input<-"+Rel_Hum_input);
		
		
		
		
		//rCon.eval("TYPE_input<-"+TYPE_input+"YEAR_input<-"+YEAR_input+"MONTH_input<-"+MONTH_input+"DAY_input<-"+DAY_input+"HOUR_input<-"+HOUR_input+"NEIGHBOURHOOD_input<-"+NEIGHBOURHOOD_input+"Weather_input<-"+Weather_input+"Temp_input<-"+Temp_input+"Rel_Hum_input<-"+Rel_Hum_input);
		System.out.println(TYPE+"+"+YEAR+"+"+ Rel_Hum);
		System.out.println(YEAR);
		System.out.println(MONTH);
		System.out.println(DAY);
		System.out.println(HOUR);
		System.out.println(NEIGHBOURHOOD);
		System.out.println(Weather);
		System.out.println(Temp);
		System.out.println(Rel_Hum);
		
		
		
//		rCon.eval("input_values<-as.data.frame(as.list(c(TYPE_input,"+
//		"YEAR_input,MONTH_input,DAY_input,HOUR_input,NEIGHBOURHOOD_input"+
//				"Weather_input,Temp_input,Rel_Hum_input)))");
//		rCon.eval("names(input_values)<-c('TYPE_number','YEAR','MONTH_number','DAY_number',"+
//				"'HOUR_number','NEIGHBOURHOOD_number','Weather_number','Temp','Rel_Hum')");

		
		rCon.eval("input_values<-as.data.frame(as.list(c(TYPE_input,YEAR_input,MONTH_input,DAY_input,HOUR_input,NEIGHBOURHOOD_input,Weather_input,Temp_input,Rel_Hum_input)))");
		
		
		rCon.eval("names(input_values)<-c('TYPE_number','YEAR','MONTH_number','DAY_number','HOUR_number','NEIGHBOURHOOD_number','Weather_number','Temp','Rel_Hum')");
		
		System.out.println("네이밍");
		
		rCon.eval("pred <- predict(rf, input_values)");
		
		System.out.println("예측");
		
		String Latitude = rCon.eval("pred$regrOutput$Latitude$predicted").asString();
		String Longitude = rCon.eval("pred$regrOutput$Longitude$predicted").asString();
		
		rCon.close();
		
		System.out.println(Latitude);
		System.out.println(Longitude);
		
		
		//RequestDispatcher dispatcher =
		
		//return "machineinput?Latitude="+Latitude+"&Longitude="+Longitude;
		//return "redirect:result_map";
		return "redirect:result_map?Latitude="+Latitude+"&Longitude="+Longitude+"&NEIGHBOURHOOD="+NEIGHBOURHOOD_input;
	}
	
    @RequestMapping("/map")
    public String map() {
    return "map";
    } 
	
	
	
	@RequestMapping("/list")
	public String list2(Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("weatherlist", dao.weather_list_Dao());
		
		//R 연동
		//rCon = new RConnection();
		
		
		
		return "machineinput";
	}
	
	
	//@RequestMapping("/list")
	public byte[] getPlot() throws RserveException, REXPMismatchException, IOException{
//		IDao dao = sqlSession.getMapper(IDao.class);
//		model.addAttribute("weatherlist", dao.weather_list_Dao());
		
		//R 연동
		rCon = new RConnection();
		rCon.eval("library(RMySQL)");
		rCon.eval("conn <- dbConnect(MySQL(),\n" + 
				"                 dbname = \"crime_vancouver\",\n" + 
				"                  user = \"root\",\n" + 
				"                  password = \"1111\",\n" + 
				"                  host= \"127.0.0.1\"\n" + 
				"                 )");
		rCon.eval("crime_all<-dbGetQuery(conn, \"select*from crime_all\")");
		rCon.eval("library(plotrix)");
		rCon.eval("crime_type<-table(crime_all$TYPE)");
		rCon.eval("crime_ratio<-round(crime_type /sum(crime_type) *100 , 2)");
		rCon.eval("type<-c(\"Enter Commercial\",\"Enter Residential/Other\",\"Homicide\",\"Mischief\",\"Offence Against a Person\",\"Other Theft\",\"Theft from Vehicle\",\"Theft of Bicycle\",\"Theft of Vehicle\",\"Traffic Accident(Fatality)\",\"Traffic Accident(Injury)\")");
		rCon.eval("label <- paste(type, \"\\n\", crime_ratio, \"%\")");
		
		rCon.eval("png('crim3Dsplot.png')");
		
		rCon.eval("pie3D(crime_type,\n" + 
				"     main = \"Crime Type(2003~2019)\",\n" + 
				"     col = rainbow(length(crime_type)),\n" + 
				"     labels = label,\n" + 
				"      explode = 0.05, # 찢어져서 보인다.\n" + 
				"      labelcex = 0.8,\n" + 
				"     #radius = 1.\n" + 
				"\n" + 
				"     )");
		rCon.eval("dev.off()");
		
		
		RFileInputStream is = rCon.openFile("crim3Dsplot.png"); 
		byte[] buf = new byte[9000];
		System.out.println("read" + is.read(buf)+ "bytes");
		is.close();
		rCon.close();
		
		return buf;
	}
	
	public byte [] getbarplot()throws RserveException, REXPMismatchException, IOException{
		rCon = new RConnection();
		rCon.eval("library(RMySQL)");
		rCon.eval("conn <- dbConnect(MySQL(),\n" + 
				"                 dbname = \"crime_vancouver\",\n" + 
				"                  user = \"root\",\n" + 
				"                  password = \"1111\",\n" + 
				"                  host= \"127.0.0.1\"\n" + 
				"                 )");
		
		rCon.eval("library(ggplot2)");
		System.out.println("어디가 안되는 거냐??");
		rCon.eval("crime_all<-dbGetQuery(conn, 'select*from crime_all')");
		System.out.println("알려줘");
		
		rCon.eval("crime_type_count<-as.data.frame(table(crime_all$TYPE,crime_all$YEAR))");
		
		rCon.eval("agg_year<- aggregate(Freq~Var2 ,crime_type_count, sum)");
		System.out.println("알려줘요!!");
		rCon.eval("YEAR <- c(as.character(agg_year$Var2))");
		
		//rCon.eval("png(filename = 'crimbarsplot.png',type = 'cairo', antialias = 'subpixel',width = 800, height = 800)");
		rCon.eval("png('crimbarsplot.png')");
		System.out.println("어니댜?");
//		rCon.eval("ggplot(agg_year,\n" + 
//				"      aes(x=Var2, y=Freq,fill=YEAR))+theme_bw()+geom_bar(stat = \"identity\", position = \"dodge\")+\n" + 
//				"    labs(title = \"YEAR &CRIME COUNT\", y = \"count\", x = \"year\")");
		
//		rCon.eval("ggplot(agg_year, aes(x=Var2, y=Freq,fill=YEAR))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge')+ labs(title = 'YEAR &CRIME COUNT', y = 'count', x = 'year')+scale_fill_manual(values=c('#ff4500','#ff6600','#ff8c00','#ff9900','#ffa500','#ffcc00','#ffd700','#ffff00','#ffff00','#ffff00','#ffff00','#ffff00','#ffff00','#ffff00','#fafad2','#fafad2','#eee8aa'))");
//		rCon.eval("print(ggplot(agg_year, aes(x=Var2, y=Freq,fill=YEAR))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge')+ labs(title = 'YEAR &CRIME COUNT', y = 'count', x = 'year')+scale_fill_manual(values=c('#ff4500','#ff6600','#ff8c00','#ff9900','#ffa500','#ffcc00','#ffd700','#ffff00','#ffff00','#ffff00','#ffff00','#ffff00','#ffff00','#ffff00','#fafad2','#fafad2','#eee8aa')))");
		rCon.eval("ggplot(agg_year, aes(x=Var2, y=Freq,fill=YEAR))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge',fill='#778899')+ labs(title = 'YEAR &CRIME COUNT', y = 'count', x = 'year')");
		rCon.eval("print(ggplot(agg_year, aes(x=Var2, y=Freq,fill=YEAR))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge',fill='#778899')+ labs(title = 'YEAR &CRIME COUNT', y = 'count', x = 'year'))");
		
		//rCon.parseAndEval("print()");
		
		System.out.println("여기냐??");
		rCon.eval("dev.off()");
		rCon.eval("dbDisconnect(conn)");

		RFileInputStream barpng = rCon.openFile("crimbarsplot.png"); 
		
		byte[] bar = new byte[9999999];
		System.out.println("read" + barpng.read(bar)+ "bytes");
		
		barpng.close();
		rCon.close();
		
		
		return bar;
	}
	
	
	
	public byte [] getmonthbar()throws RserveException, REXPMismatchException, IOException{
		rCon = new RConnection();
		rCon.eval("library(RMySQL)");
		rCon.eval("conn <- dbConnect(MySQL(),\n" + 
				"                 dbname = \"crime_vancouver\",\n" + 
				"                  user = \"root\",\n" + 
				"                  password = \"1111\",\n" + 
				"                  host= \"127.0.0.1\"\n" + 
				"                 )");
		
		rCon.eval("library(ggplot2)");
		System.out.println("월별 라이브러리");
		rCon.eval("crime_all<-dbGetQuery(conn, 'select*from crime_all')");
		rCon.eval("crime_month<-as.data.frame(table(crime_all$TYPE, crime_all$MONTH))");
		rCon.eval("names(crime_month) <- c(\"TYPE\", \"MONTH\", \"COUNT\")");
		rCon.eval("agg_month<- aggregate(COUNT~MONTH ,crime_month, sum)");
		
		rCon.eval("png('monthplot.png')");
		
		System.out.println("plot그렸다.");
		
//		rCon.eval("ggplot(agg_month, aes(x=MONTH, y=COUNT,fill=MONTH))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge')+ labs(title = 'MONTH &CRIME COUNT', y = 'count', x = 'month')+scale_fill_manual(values=c('#000080','#00008b','#0000cd','#3366ff','#1e90ff','#00bfff','#87cefa','#87ceeb','#b0e0e6','#add8eb','#f0f8ff','#f0ffff'))");
//		rCon.eval("print(ggplot(agg_month, aes(x=MONTH, y=COUNT,fill=MONTH))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge')+ labs(title = 'MONTH &CRIME COUNT', y = 'count', x = 'month')+scale_fill_manual(values=c('#000080','#00008b','#0000cd','#3366ff','#1e90ff','#00bfff','#87cefa','#87ceeb','#b0e0e6','#add8eb','#f0f8ff','#f0ffff')))");
		rCon.eval("ggplot(agg_month, aes(x=MONTH, y=COUNT,fill=MONTH))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge', fill= '#c0c0c0')+ labs(title = 'MONTH &CRIME COUNT', y = 'count', x = 'month')");
		rCon.eval("print(ggplot(agg_month, aes(x=MONTH, y=COUNT,fill=MONTH))+theme_bw()+geom_bar(stat = 'identity', position = 'dodge', fill= '#c0c0c0')+ labs(title = 'MONTH &CRIME COUNT', y = 'count', x = 'month'))");
		
		System.out.println("plot 다그렸다.");
		
		rCon.eval("dev.off()");
		rCon.eval("dbDisconnect(conn)");
		
		RFileInputStream monthpng = rCon.openFile("monthplot.png");
		byte[] monthbar = new byte[9999999];
		
		System.out.println("read" + monthpng.read(monthbar)+ "bytes");
		
		monthpng.close();
		rCon.close();
		
		
		return monthbar;
	}

	
	@RequestMapping("geo_map")
	public String geo_map( Model model){ { 
//		
//		//System.out.println(Search);
//		session.setAttribute("NEIGHBOURHOOD1", NEIGHBOURHOOD);
//		session.setAttribute("year1", year);
//		
		
		
		
		
		return "geo_map";
	} 
	}
	
	
	@RequestMapping("/graph")
	public String graph(String NEIGHBOURHOOD,String year , Model model, HttpSession session)throws RserveException, REXPMismatchException {
		session.setAttribute("NEIGHBOURHOOD1", NEIGHBOURHOOD);
		session.setAttribute("year1", year);
		return "geo_weather_graph";
	} 
	
	
	
	
	public byte[] getgeo_map(HttpSession session)throws RserveException, REXPMismatchException, IOException {
		
		//HttpSession session = Request.;
		
		
//		String search_neighbourhood= (String)session.getAttribute("NEIGHBOURHOOD1");
//		int search_year= Integer.parseInt((String)session.getAttribute("year1"));
		String search_neighbourhood= "Fairview";
		int search_year= 2003;
		
		
		
		rCon = new RConnection();
		rCon.eval("library(RMySQL)");
		rCon.eval("conn <- dbConnect(MySQL(),\n" + 
				"                 dbname = \"crime_vancouver\",\n" + 
				"                  user = \"root\",\n" + 
				"                  password = \"1111\",\n" + 
				"                  host= \"127.0.0.1\"\n" + 
				"                 )");
		
		System.out.println("지도  R DB연동");
		
		rCon.eval("crime_weather<-dbGetQuery(conn, 'select*from crime_all')");
		System.out.println("크리미 변수 만들고");
		
		rCon.eval("library(ggmap)"); 
		rCon.eval("library(maps)"); 
		rCon.eval("library(mapproj)"); 
		rCon.eval("register_google(key='')"); 
				//키 나중에 넣어야함 
		
		System.out.println("범죄별 연도별 자르기");
		
		rCon.eval("crime_sub <- crime_weather[(crime_weather$NEIGHBOURHOOD=='Fairview') & (crime_weather$YEAR==2003),]");
		
		
		System.out.println("지도 background 만들기");
		
//		rCon.eval("vancouver <- get_googlemap(c(crime_sub$Longitude[1], crime_sub$Latitude[1]), zoom =14,maptype = \"roadmap\")\n" + 
//				"vancouvermap <- ggmap(vancouver)");
		
		rCon.eval("vancouver <- get_googlemap(c(126.9793, 37.57323), zoom =14,maptype = 'roadmap')");
		System.out.println("뭐가 안되는거야");
		rCon.eval("vancouvermap <- ggmap(vancouver)");
		
		
		System.out.println("지도찍기");
		
		rCon.eval("png('geo_map.png')");
		
//		rCon.eval("vancouver_map_p <- vancouvermap + scale_fill_brewer(palette = \"Set2\") + geom_point(data = crime_sub,\n" + 
//				"                                                             aes(x=Longitude, y= Latitude),\n" + 
//				"                                                             shape = 16, color = \"red\",\n" + 
//				"                                                              alpha = 0.4)+\n" + 
//				"                    theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(),axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+\n" + 
//				"                    ggtitle(crime_sub$NEIGHBOURHOOD[1],paste(crime_sub$YEAR[1],\"YEAR\"))");
		
		//rCon.eval("vancouver_map_p <- vancouvermap + scale_fill_brewer(palette = 'Set2') + geom_point(data = crime_sub,aes(x=Longitude, y= Latitude),shape = 16, color = 'red',alpha = 0.4)+theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(),axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ggtitle(crime_sub$NEIGHBOURHOOD[1],paste(crime_sub$YEAR[1],'YEAR'))");
		System.out.println("여기까지는 오나??");
		//rCon.eval("print(vancouver_map_p <- vancouvermap + scale_fill_brewer(palette = 'Set2') + geom_point(data = crime_sub,aes(x=Longitude, y= Latitude),shape = 16, color = 'red',alpha = 0.4)+theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(),axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ggtitle(crime_sub$NEIGHBOURHOOD[1],paste(crime_sub$YEAR[1],'YEAR')))");
//		rCon.eval("print(vancouver_map_p)");
		rCon.eval("print(vancouvermap)");
		
		System.out.println("그럼이거??");
		rCon.eval("dev.off()");
		System.out.println("이거?");
		rCon.eval("dbDisconnect(conn)");
		System.out.println("이것인가??");
		
		RFileInputStream geo_mappng = rCon.openFile("geo_map.png");
		byte[] geo_mapbyte = new byte[9999999];
		
		System.out.println("read" + geo_mappng.read(geo_mapbyte)+ "bytes");
		
		geo_mappng.close();
		rCon.close();
		
		
		
		return geo_mapbyte;
		
	}
	
	
	

		

	
	
	
	@RequestMapping("/maptest")
	public String maptest(Model model, String NEIGHBOURHOOD,String YEAR, HttpSession session) {
		
		session.setAttribute("NEIGHBOURHOOD", NEIGHBOURHOOD);
		session.setAttribute("YEAR", YEAR);
		
//		String NEIGHBOURHOOD1= (String)session.getAttribute("NEIGHBOURHOOD");
//		int search_year= Integer.parseInt((String)session.getAttribute("year1"));
//		
//		String YEAR1= (String)session.getAttribute("YEAR");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		//System.out.println(dao.lat_long_Dao(NEIGHBOURHOOD,YEAR));
	//	dao.lat_long_Dao(NEIGHBOURHOOD,YEAR);
	//	System.out.println("요거1"+dao);
	//	System.out.println("요거2"+model.addAttribute("lat_long", dao.lat_long_Dao(NEIGHBOURHOOD, YEAR).get(0)));
//		model.addAllAttributes("lat_long", dao.lat_long_Dao());
//		model.addAllAttributes("lat_long", dao.lat_long_Dao(NEIGHBOURHOOD, YEAR));
		//System.out.println(model.addAttribute(NEIGHBOURHOOD, YEAR));
		model.addAttribute("lat_long",dao.lat_long_Dao(NEIGHBOURHOOD, YEAR));
		
//		Model aa = model.addAttribute("lat_long",dao.lat_long_Dao(NEIGHBOURHOOD, YEAR));
//		String bb= aa.toString();
//		System.out.println(bb);
		//System.out.println(String.hashCode(model.addAttribute("lat_long",dao.lat_long_Dao(NEIGHBOURHOOD, YEAR))));
		
		
		return "maptest";
	} 
	
	
	@RequestMapping("/overallweathercount")
	public String overallweather(Model model, HttpSession session) {
		
//		String NEIGHBOURHOOD = (String)session.getAttribute("NEIGHBOURHOOD");
//		String YEAR = (String)session.getAttribute("YEAR");
		
		
		
		
		
		return "overallweathercount";
		
		
	} 

	
	
//	public byte[] overallweathergraph(HttpSession session)throws RserveException, REXPMismatchException, IOException {
//		
//		String NEIGHBOURHOOD = (String)session.getAttribute("NEIGHBOURHOOD");
//		String YEAR = (String)session.getAttribute("YEAR");
//		
//		
//		rCon = new RConnection();
//		rCon.eval("library(RMySQL)");
//		rCon.eval("conn <- dbConnect(MySQL(),\n" + 
//				"                 dbname = \"crime_vancouver\",\n" + 
//				"                  user = \"root\",\n" + 
//				"                  password = \"1111\",\n" + 
//				"                  host= \"127.0.0.1\"\n" + 
//				"                 )");
//		
//		System.out.println("날씨카운트 그래프  R DB연동");
//		
//		rCon.eval("crime_weather<-dbGetQuery(conn, 'select*from crime_all')");
//		System.out.println("크리미 변수 만들고");
//		
//		
//		rCon.eval("library(ggplot2)"); 
//		System.out.println("f라이브러리");
//		
//		
//		rCon.eval("aa<-as.data.frame(table(crime_weather$Weather))");
//		System.out.println("변수주고");
//		
//		rCon.eval("png('overallweather.png')");
//		rCon.eval("ggplot(aa,aes(x=Var1, y=log1p(Freq)))+geom_bar(stat='identity',fill='skyblue')+theme(axis.text.x = element_text(angle=90, hjust=1),axis.text.y=element_blank())+ geom_text(aes(label=aa$Freq),position = position_dodge(width=1.8), vjust=-0.5, size=2)+labs(title = 'Weather Count', y = 'count', x = 'Weather')");
//		System.out.println("ggplot이다.");
//		
//		
//		
//		rCon.eval("print(ggplot(aa,aes(x=Var1, y=log1p(Freq)))+geom_bar(stat='identity',fill='skyblue')+theme(axis.text.x = element_text(angle=90, hjust=1),axis.text.y=element_blank())+ geom_text(aes(label=aa$Freq),position = position_dodge(width=1.8), vjust=-0.5, size=2)+labs(title = 'Weather Count', y = 'count', x = 'Weather'))");
//		System.out.println("프린트하고");
//		
//		
//		rCon.eval("dev.off()");
//		System.out.println("이거?");
//		
//		
//		rCon.eval("dbDisconnect(conn)");
//		System.out.println("이것인가??");
//		
//		RFileInputStream overallweather = rCon.openFile("overallweather.png");
//		byte[] overallweather_byte = new byte[9999999];
//		
//		System.out.println("read" + overallweather.read(overallweather_byte)+ "bytes");
//		
//		overallweather.close();
//		rCon.close();
//		
//		
//		
//		return overallweather_byte;
//	}
	
	
	
	
	
public byte[] overallweathergraph(HttpSession session)throws RserveException, REXPMismatchException, IOException {
		
		String NEIGHBOURHOOD = (String)session.getAttribute("NEIGHBOURHOOD");
		String YEAR = (String)session.getAttribute("YEAR");
		
		
		rCon = new RConnection();
	
		rCon.eval("library(RMySQL)");
		rCon.eval("conn <- dbConnect(MySQL(),\n" + 
				"                 dbname = \"crime_vancouver\",\n" + 
				"                  user = \"root\",\n" + 
				"                  password = \"1111\",\n" + 
				"                  host= \"127.0.0.1\"\n" + 
				"                 )");
		
		System.out.println("날씨카운트 그래프  R DB연동");
		
		rCon.eval("crime_sub <- crime_weather[(crime_weather$NEIGHBOURHOOD=='"+NEIGHBOURHOOD+"') & (crime_weather$YEAR=="+YEAR+"),]");
		//rCon.eval("crime_weather<-dbGetQuery(conn, 'select*from crime_all')");
		System.out.println(rCon.eval("crime_sub <- crime_weather[(crime_weather$NEIGHBOURHOOD=='"+NEIGHBOURHOOD+"') & (crime_weather$YEAR=="+YEAR+"),]"));
		System.out.println("이것이다."+NEIGHBOURHOOD+" "+YEAR);
		System.out.println("크리미 변수 만들고");
		
		
		rCon.eval("library(ggplot2)"); 
		System.out.println("f라이브러리");
		
		
		//rCon.eval("aa<-as.data.frame(table(crime_sub$Weather))");
		
		
		
		System.out.println("변수주고");
		

		
		rCon.eval("mm<-(aggregate(Temp ~MONTH, data=crime_sub, mean))");
		
		rCon.eval("mm_max<-(aggregate(Temp ~MONTH, data=crime_sub, max))");
		
		rCon.eval("mm_min<-(aggregate(Temp ~MONTH, data=crime_sub, min))");
		System.out.println("변수끝");
		rCon.eval("png('overallweather.png')");
		
		
		rCon.eval("ggplot(mm,aes(x=MONTH, y=Temp))+theme_bw()+geom_line()+scale_x_continuous(breaks = mm$MONTH)+\n" + 
				"            geom_line(data=mm_max, aes(x=MONTH, y=Temp), color= \"red\")+\n" + 
				"            geom_line(data=mm_min, aes(x=MONTH, y=Temp), color= \"blue\")+\n" + 
				"    annotate(\"text\", x = mm_max$MONTH[2],y=20, label = \"maxTemp\",\n" + 
				"           color=\"red\",size=4)+\n" + 
				"    annotate(\"text\", x = mm$MONTH[2],y=10, label = \"meanTemp\",\n" + 
				"           color=\"black\",size=4)+\n" + 
				"    annotate(\"text\", x = mm_min$MONTH[2],y=-5, label = \"minTemp\",\n" + 
				"           color=\"blue\",size=4)+\n" + 
				"    geom_text(aes(x = mm_max$MONTH[mm_max$Temp==max(mm_max$Temp)], y = max(mm_max$Temp),\n" + 
				"                  label=paste(max(mm_max$Temp),\"℃\")), color = \"red\",size = 4)+\n" + 
				"    geom_text(aes(x = mm_min$MONTH[mm_min$Temp==min(mm_min$Temp)], y = min(mm_min$Temp),\n" + 
				"                  label=paste(min(mm_min$Temp),\"℃\")), color = \"blue\",size = 4)+\n" + 
				"\n" + 
				"     geom_text(aes(x = 4.5, y = 11.09,\n" + 
				"                  label=paste(round(mean(mm$Temp),2),\"℃\")), color = \"black\",size = 4)+\n" + 
				"    ggtitle(\"max, mean, min Temperature of Month\")\n" + 
				"\n" + 
				"");
		
		
//		rCon.eval("ggplot(aa,aes(x=Var1, y=log1p(Freq)))+geom_bar(stat='identity',fill='skyblue')+theme(axis.text.x = element_text(angle=90, hjust=1),axis.text.y=element_blank())+ geom_text(aes(label=aa$Freq),position = position_dodge(width=1.8), vjust=-0.5, size=2)+labs(title = 'Weather Count', y = 'count', x = 'Weather')");
		System.out.println("ggplot이다.");
		
		
		rCon.eval("print(ggplot(mm,aes(x=MONTH, y=Temp))+theme_bw()+geom_line()+scale_x_continuous(breaks = mm$MONTH)+\n" + 
				"            geom_line(data=mm_max, aes(x=MONTH, y=Temp), color= \"red\")+\n" + 
				"            geom_line(data=mm_min, aes(x=MONTH, y=Temp), color= \"blue\")+\n" + 
				"    annotate(\"text\", x = mm_max$MONTH[2],y=20, label = \"maxTemp\",\n" + 
				"           color=\"red\",size=4)+\n" + 
				"    annotate(\"text\", x = mm$MONTH[2],y=10, label = \"meanTemp\",\n" + 
				"           color=\"black\",size=4)+\n" + 
				"    annotate(\"text\", x = mm_min$MONTH[2],y=-5, label = \"minTemp\",\n" + 
				"           color=\"blue\",size=4)+\n" + 
				"    geom_text(aes(x = mm_max$MONTH[mm_max$Temp==max(mm_max$Temp)], y = max(mm_max$Temp),\n" + 
				"                  label=paste(max(mm_max$Temp),\"℃\")), color = \"red\",size = 4)+\n" + 
				"    geom_text(aes(x = mm_min$MONTH[mm_min$Temp==min(mm_min$Temp)], y = min(mm_min$Temp),\n" + 
				"                  label=paste(min(mm_min$Temp),\"℃\")), color = \"blue\",size = 4)+\n" + 
				"\n" + 
				"     geom_text(aes(x = 4.5, y = 11.09,\n" + 
				"                  label=paste(round(mean(mm$Temp),2),\"℃\")), color = \"black\",size = 4)+\n" + 
				"    ggtitle(\"max, mean, min Temperature of Month\")\n" + 
				"\n" + 
				")");
		
		//rCon.eval("print(ggplot(aa,aes(x=Var1, y=log1p(Freq)))+geom_bar(stat='identity',fill='skyblue')+theme(axis.text.x = element_text(angle=90, hjust=1),axis.text.y=element_blank())+ geom_text(aes(label=aa$Freq),position = position_dodge(width=1.8), vjust=-0.5, size=2)+labs(title = 'Weather Count', y = 'count', x = 'Weather'))");
		System.out.println("프린트하고");
		
		
		rCon.eval("dev.off()");
		System.out.println("이거?");
		
		
		rCon.eval("dbDisconnect(conn)");
		System.out.println("이것인가??");
		
		RFileInputStream overallweather = rCon.openFile("overallweather.png");
		byte[] overallweather_byte = new byte[9999999];
		
		System.out.println("read" + overallweather.read(overallweather_byte)+ "bytes");
		
		overallweather.close();
		rCon.close();
		
		
		
		return overallweather_byte;
	}
	
	
	
	
	
	
	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ test 부분
	
	@RequestMapping("/test")
	public String test(Model model) {
		
		return "test";
	} 
	
	@RequestMapping("/sessiontest")
	public String sessiontest(Model model, HttpSession session) {
		
//		String a= (String)session.getAttribute("Search1");
//		System.out.println(session.getAttribute("Search1"));
		
		return "sessiontest";
	} 
	
	
	@RequestMapping("/sessiontest2")
	public String sessiontest2(Model model) {
		
		return "sessiontest2";
	} 
	
	
	
	
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ test 부분
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	  @RequestMapping("/geo_map") 
//	  public String geo_map(Model model) {
//	  
//	  return "geo_map"; 
//	  }
	 
	
	
	
	
	
	
	
	
//	public String[][] getcoordinates() throws RserveException, REXPMismatchException{
//		
//		rCon = new RConnection();
//		rCon.eval("library(RMySQL)");
//		rCon.eval("conn <- dbConnect(MySQL(), dbname = 'crime_vancouver', user = 'root', password = '1111', host= '127.0.0.1')");
//		System.out.println("DB complete");
//		
//		rCon.eval("load('C:/Users/KJW/Desktop/KJW/BigData/semiproject/last_model.dat')");
//		//model.
//		
//		
//	}
	
	
	
	
	
	
	
	
}
