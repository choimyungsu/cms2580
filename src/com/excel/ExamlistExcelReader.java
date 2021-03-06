package com.excel;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.exam.Examlist;

//import com.exam.ExamlistDAO;


//한글파일을 위한 클래스 import
/*
import static org.apache.tika.mime.MediaType.application;

import java.util.Map;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.metadata.TikaCoreProperties;
import org.apache.tika.mime.MediaType;
import org.apache.tika.mime.MediaTypeRegistry;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.xml.sax.ContentHandler;
*/


public class ExamlistExcelReader {
	
	/**
	 * XLSX 업로드List<Examlist> 
	 * @param filePath
	 * @return
	 */
	public List<Examlist> xlsxToDBgisulsaExamList(String filePath) {
		// 諛섑솚�븷 媛앹껜瑜� �깮�꽦
		List<Examlist> list = new ArrayList<Examlist>();
		
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try {
			
			fis= new FileInputStream(filePath);
			// HSSFWorkbook�� �뿊���뙆�씪 �쟾泥� �궡�슜�쓣 �떞怨� �엳�뒗 媛앹껜
			workbook = new XSSFWorkbook(fis);
			
			// �깘�깋�뿉 �궗�슜�븷 Sheet, Row, Cell 媛앹껜
			XSSFSheet curSheet;
			XSSFRow   curRow;
			XSSFCell  curCell;
			Examlist vo;
			
			// Sheet �깘�깋 for 臾�
			for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// �쁽�옱 Sheet 諛섑솚
				curSheet = workbook.getSheetAt(sheetIndex);
				// row �깘�깋 for臾�
				for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0�� �뿤�뜑�젙蹂댁씠湲� �븣臾몃뜲 臾댁떆
					if(rowIndex != 0) {
						// �쁽�옱 row 諛섑솚
						curRow = curSheet.getRow(rowIndex);
						vo = new Examlist();
						String value;
						
						// row�쓽 泥ル쾲吏� cell媛믪씠 鍮꾩뼱�엳吏� �븡�� 寃쎌슦留� cell �깘�깋
						if(!"".equals(curRow.getCell(0).getStringCellValue())) {
							
							// cell �깘�깋 for 臾�
							for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
								
								if(true) {
									value = "";
									// cell �뒪���씪�씠 �떎瑜대뜑�씪�룄 String�쑝濡� 諛섑솚 諛쏆쓬
									switch (curCell.getCellType()){
					                case HSSFCell.CELL_TYPE_FORMULA:
					                	value = curCell.getCellFormula();
					                    break;
					                case HSSFCell.CELL_TYPE_NUMERIC:
					                	value = curCell.getNumericCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_STRING:
					                    value = curCell.getStringCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_BLANK:
					                    value = curCell.getBooleanCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_ERROR:
					                    value = curCell.getErrorCellValue()+"";
					                    break;
					                default:
					                	value = new String();
										break;
					                }
									
									// �쁽�옱 column index�뿉 �뵲�씪�꽌 vo �뿉 �엯�젰
									switch (cellIndex) {
									case 0: // examCode
										vo.setExamcode(value);
										break;
										
									case 1: // turn
										vo.setTurn(value);
										break;
										
									case 2: // domain
										vo.setDomain(value);
										break;
										
									case 3: // period
										vo.setPeriod(value);
										break;
									
									case 4: // examDesc
										vo.setExamdesc(value);
										break;
										
									case 5: // answer
										vo.setAnswer(value);
										break;	

									case 6: // answerDesc
										vo.setAnswerdesc(value);
										break;										
									
		
									default:
										break;
									}
								}
							}
							// cell �깘�깋 �씠�썑 vo 異붽�
							list.add(vo);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				// 占쎄텢占쎌뒠占쎈립 占쎌쁽占쎌뜚占쏙옙 finally占쎈퓠占쎄퐣 占쎈퉸占쎌젫
				if( workbook!= null) workbook.close();
				if( fis!= null) fis.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	
	/**
	 * XLSX 업로드 List<Examlist> 
	 * @param filePath
	 * @return
	 */
	public List<Examlist> xlsxToDBgisaExamList(String filePath) {
		// 반환할 객체를 생성
		List<Examlist> list = new ArrayList<Examlist>();
		
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		
		try {
			
			fis= new FileInputStream(filePath);
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체 
			workbook = new XSSFWorkbook(fis);
			
			// 탐색에 사용할 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow   curRow;
			XSSFCell  curCell;
			Examlist vo;
			
			// Sheet 탐색 for 문
			for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 Sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if(rowIndex != 0) {
						// 현재 row 반환
						curRow = curSheet.getRow(rowIndex);
						vo = new Examlist();
						String value;
						
						// row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
						if(!"".equals(curRow.getCell(0).getStringCellValue())) {
							
							// cell 탐색 for 문
							for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
								
								if(true) {
									value = "";
									// cell 스타일이 다르더라도 String으로 반환 받음
									switch (curCell.getCellType()){
					                case HSSFCell.CELL_TYPE_FORMULA:
					                	value = curCell.getCellFormula();
					                    break;
					                case HSSFCell.CELL_TYPE_NUMERIC:
					                	value = curCell.getNumericCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_STRING:
					                    value = curCell.getStringCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_BLANK:
					                    value = curCell.getBooleanCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_ERROR:
					                    value = curCell.getErrorCellValue()+"";
					                    break;
					                default:
					                	value = new String();
										break;
					                }
									
									// 현재 column index에 따라서 vo에 입력
									switch (cellIndex) {
									case 0: // examCode
										vo.setExamcode(value);
										break;
										
									case 1: // turn
										vo.setTurn(value);
										break;
										
									case 2: // domain
										vo.setDomain(value);
										break;
										
									case 3: // examNum
										vo.setExamnum(value);
										break;
									
									case 4: // examDesc
										vo.setExamdesc(value);
										break;
										
									case 5: // answer
										vo.setAnswer(value);
										break;	

									case 6: // answerDesc
										vo.setAnswerdesc(value);
										break;	
										
									default:
										break;
									}
								}
							}
							// cell 탐색 이후  vo 추가
							list.add(vo);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				// 占쎄텢占쎌뒠占쎈립 占쎌쁽占쎌뜚占쏙옙 finally占쎈퓠占쎄퐣 占쎈퉸占쎌젫
				if( workbook!= null) workbook.close();
				if( fis!= null) fis.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	
// xls �삎�떇�씪 寃쎌슦 	
public List<Examlist> xlsToCustomerVoList(String filePath) {
		
		// 
		List<Examlist> list = new ArrayList<Examlist>();
		
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		
		try {
			
			fis= new FileInputStream(filePath);
			// 
			workbook = new HSSFWorkbook(fis);
			
			// 
			HSSFSheet curSheet;
			HSSFRow   curRow;
			HSSFCell  curCell;
			Examlist vo;
			
			// 
			for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 
				curSheet = workbook.getSheetAt(sheetIndex);
				// 
				for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// 
					if(rowIndex != 0) {
						// 
						curRow = curSheet.getRow(rowIndex);
						vo = new Examlist();
						String value;
						
						// 
						if(!"".equals(curRow.getCell(0).getStringCellValue())) {
							
							// 
							for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
								
								if(true) {
									value = "";
									// 
									switch (curCell.getCellType()){
					                case HSSFCell.CELL_TYPE_FORMULA:
					                	value = curCell.getCellFormula();
					                    break;
					                case HSSFCell.CELL_TYPE_NUMERIC:
					                	value = curCell.getNumericCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_STRING:
					                    value = curCell.getStringCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_BLANK:
					                    value = curCell.getBooleanCellValue()+"";
					                    break;
					                case HSSFCell.CELL_TYPE_ERROR:
					                    value = curCell.getErrorCellValue()+"";
					                    break;
					                default:
					                	value = new String();
										break;
					                }
									
									// 
									switch (cellIndex) {
									
									case 0: // examCode
										vo.setExamcode(value);
										break;
										
									case 1: // turn
										vo.setTurn(value);
										break;
										
									case 2: // domain
										vo.setDomain(value);
										break;
										
									case 3: // period
										vo.setPeriod(value);
										break;
									
									case 4: // examDesc
										vo.setExamdesc(value);
										break;
		
									default:
										break;
									}
								}
							}
							// cell 
							list.add(vo);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				// 
				if( workbook!= null) workbook.close();
				if( fis!= null) fis.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
/*	
public void hwpToTxt(String inputFilePath, String outfutFilePath)
{
    try {
//	InputStream input=new FileInputStream(new File("c:\\hwp\\sample.hwp"));
//   OutputStream output = new FileOutputStream("c:\\hwp\\sample.txt");
    InputStream input=new FileInputStream(new File(inputFilePath));
    OutputStream output = new FileOutputStream(outfutFilePath);
    
    ContentHandler handler = new BodyContentHandler(new OutputStreamWriter(output, "UTF-8"));
    Metadata metadata = new Metadata();
    ParseContext context = new ParseContext();
    Parser parser = new AutoDetectParser();

    parser.parse(input,handler,metadata,context);
        
    System.out.println("title => " + metadata.get(TikaCoreProperties.TITLE));
    System.out.println("creator => " + metadata.get(TikaCoreProperties.CREATOR));
    System.out.println("keywords => " + metadata.get(TikaCoreProperties.KEYWORDS));
    System.out.println("description => " + metadata.get(TikaCoreProperties.DESCRIPTION));
    System.out.println("comments => " + metadata.get(TikaCoreProperties.COMMENTS));
    // Alfresco 에서 한글문서의 문서정보에서 날짜가 날짜 형식에 맞지 않으면 error 를 발생해서
    // TikaCoreProperties.CREATED 는 사용하지 않고  hwp_create_time 로 대체해서 사용
    // System.out.println("createtime => " + metadata.get(TikaCoreProperties.CREATED));
    System.out.println("createtime => " + metadata.get("hwp_create_time"));
    }catch(FileNotFoundException e) {
    	e.printStackTrace();
    	
    } catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		
	}
}
	
	*/
	
	
	
	
	
	
}
