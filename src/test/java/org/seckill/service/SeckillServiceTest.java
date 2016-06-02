package org.seckill.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by moonie on 16/6/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class SeckillServiceTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillService seckillService;

    @Test
    public void getSeckillList() throws Exception {
        List<Seckill> list = seckillService.getSeckillList();
        logger.info("list={}",list);
    }

    @Test
    public void getById() throws Exception {
        long id = 1L;
        Seckill seckill = seckillService.getById(id);
        logger.info("seckill={}",seckill);
    }

    @Test
    public void exportSeckillUrl() throws Exception {
        Exposer exposer = seckillService.exportSeckillUrl(1L);
        logger.info("exposer={}",exposer.getMd5());
        // 683b5abb140788e3f5808c83e229da81
    }

    @Test
    public void executeSeckill() throws Exception {
        SeckillExecution seckillExecution = seckillService.executeSeckill(1L,15221808911L,"683b5abb140788e3f5808c83e229da81");
        logger.info("seckillExecution={}",seckillExecution.getSuccessKilled());
    }

    @Test
    public void testSeckill() throws Exception{
        Exposer exposer = seckillService.exportSeckillUrl(1L);
        logger.info("exposer={}",exposer.getMd5());
        if(exposer.isExposed()){
            try {
                SeckillExecution seckillExecution = seckillService.executeSeckill(1L,15221808913L,exposer.getMd5());
                logger.info("seckillExecution={}",seckillExecution.getSuccessKilled());
            }catch (RepeatKillException e){
                logger.info(e.getMessage());
            }catch (SeckillCloseException e){
                logger.info(e.getMessage());
            }
        }else{
            logger.warn("exposer={}",exposer.isExposed());
        }


    }

}