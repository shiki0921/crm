package com.shiki.crm.service.impl;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.VerticalAlignment;
import jxl.write.*;
import org.junit.Test;

import java.io.File;
import java.util.Date;

/**
 * @author shiki
 * @date 2019/12/23 - 23:00
 */
public class TestExcel {

    @Test
    public void testOut() throws Exception{
        //1.需要建立Excel工作的对象
        WritableWorkbook wb = Workbook.createWorkbook(new File("out.xls"));
        //2.创建sheet页
        WritableSheet sheet = wb.createSheet("第一个sheet页", 0);
        //定义宽和高
        sheet.setColumnView(0,50);
        sheet.setRowView(0,500);
        //合并单元格(左上角列号，左上角行号，右下角行号，右下角列号；合并单元格的内容由左上角的内容控制)
        sheet.mergeCells(0,0,3,3);
        //单元格格式
        WritableCellFormat st = new WritableCellFormat();
        //设置水平居中
        st.setAlignment(Alignment.CENTRE);
        //设置垂直居中
        st.setVerticalAlignment(VerticalAlignment.CENTRE);
        //3.建立单元格(列号，行号，内容)
        Label cell = new Label(0,0,"第一个单元格");
        //4.往sheet页中添加单元格信息
        sheet.addCell(cell);
        //将内容写出去
        wb.write();
        //关闭资源
        wb.close();
    }

    @Test
    public void testDateOut() throws Exception{
        //1.需要建立Excel工作的对象
        WritableWorkbook wb = Workbook.createWorkbook(new File("dateOut.xls"));
        //2.创建sheet页
        WritableSheet sheet = wb.createSheet("第一个sheet页", 0);
        DateFormat df = new DateFormat("yyyy-MM-dd:hh:mm:ss");
        WritableCellFormat st = new WritableCellFormat(df);
        DateTime cell = new DateTime(0,0,new Date(),st);
        //4.往sheet页中添加单元格信息
        sheet.addCell(cell);
        //将内容写出去
        wb.write();
        //关闭资源
        wb.close();
    }
}
