package com.grand.admin.banner;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grand.admin.banner.service.BannerwebService;
import com.grand.admin.banner.vo.BannerwebVO;


/*
 * @Controller public class BannerwebController {
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(BannerwebController.class);
 * 
 * @Resource(name="bannerwebService") private BannerwebService bannerwebService;
 * 
 * 
 * @RequestMapping(value = "/admin/banner/bannerManage", method =
 * RequestMethod.GET) public String bannerManage(Locale locale, Model model) {
 * model.addAttribute("_prefix", "_bannerwebList");
 * model.addAttribute("bannersub_parentidx", "52"); return
 * "admin/banner/bannerList";
 * 
 * }
 * 
 * @RequestMapping(value = "/admin/interface/selectBannerwebInfo", method =
 * RequestMethod.POST)
 * 
 * @ResponseBody public Map<String, Object> selectBannerwebInfo(Locale locale,
 * Model model, BannerwebVO vo) throws Exception {
 * 
 * Map<String, Object> map = new HashMap<String, Object>(); int bannersubCount =
 * bannerwebService.selectbannerwebInfoCount(vo); List<BannerwebVO>
 * bannerwebList = bannerwebService.selectbannerwebInfo(vo);
 * 
 * map.put("rows", bannerwebList); map.put("total", bannersubCount); return map;
 * }
 * 
 * @RequestMapping(value = "/grand/interface/selectBannercommonInfo", method =
 * RequestMethod.POST)
 * 
 * @ResponseBody public Map<String, Object> selectBannercommonInfo(Locale
 * locale, Model model, BannerwebVO vo) throws Exception { Map<String, Object>
 * map = new HashMap<String, Object>(); List<BannerwebVO> bannerwebcommon =
 * bannerwebService.selectBannercommonInfo(vo); map.put("row", bannerwebcommon);
 * return map; } }
 */
