package com.grand.util;

import java.awt.AlphaComposite;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.awt.image.ImageProducer;
import java.awt.image.RGBImageFilter;

import javax.imageio.ImageIO;
import javax.imageio.ImageWriter;

public class ImageUtil {
    
    static public ImageWriter getWriter(String file) {
        String formatName = file.substring(file.lastIndexOf('.')+1);
        ImageWriter writer = null;

        if(writer == null) {
            writer = ImageIO.getImageWritersByFormatName(formatName).next();

            if(writer == null) {
                String error = "Unable to create ImageWriter for format !";
                throw new RuntimeException(error);
            }
        }       
        return writer;
    }
    static public Image transformGrayToTransparency(BufferedImage image) {
        ImageFilter filter = new RGBImageFilter() {
            public final int filterRGB(int x, int y, int rgb) {
                return (rgb << 8) & 0xFF000000;
            }
        };
        ImageProducer ip = new FilteredImageSource(image.getSource(), filter);
        return Toolkit.getDefaultToolkit().createImage(ip);
    }

    static public BufferedImage applyTransparencyThumbnail(BufferedImage image, Image mask) {
        BufferedImage dest = new BufferedImage(image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = dest.createGraphics();
        g2.drawImage(image, 0, 0, null);
        AlphaComposite ac = AlphaComposite.getInstance(AlphaComposite.DST_IN, 1.0F);
        g2.setComposite(ac);

        // 우측 하단
        int w = image.getWidth();
        int h = image.getHeight();
        int iw = mask.getWidth(null)+3;
        int ih = mask.getHeight(null)+3;
        g2.drawImage(mask, w-iw, h-ih, null);
        g2.dispose();
        return dest;
    }
 
    static public BufferedImage adjustScale(BufferedImage image, int maxDim) {
        return adjustScale(image, maxDim, false);
    }
 
    static public BufferedImage adjustScale(BufferedImage image, int maxDim, boolean isFitting) {

        double scale = (double) maxDim / (double) image.getHeight();
        double scale2 = scale;
        
        if (isFitting) {
            scale2 = (double) maxDim / (double) image.getWidth();
        } else {
            if (image.getWidth() > image.getHeight()) {
                scale = (double) maxDim / (double) image.getWidth();
                scale2 = scale;
            }
        }

        int scaledH = (int) (scale * image.getHeight());
        int scaledW = (int) (scale2 * image.getWidth());

        BufferedImage dest = new BufferedImage(scaledW, scaledH, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = dest.createGraphics();
        
        AffineTransform tx = new AffineTransform();
        if (scale < 1.0d) {
            tx.scale(scale2, scale);
        }
        g2.drawImage(image, tx, null);
        g2.dispose();
        return dest;
    }

    static public BufferedImage adjustScale(BufferedImage image, Dimension dim) {

        boolean isOverWidth = image.getWidth()>dim.width;
        boolean isOverHeight = image.getHeight()>dim.height;

        double scale = dim.getHeight() / (double) image.getHeight();
        double scale2 = dim.getHeight() / (double) image.getHeight();
        
        if (isOverWidth&&isOverHeight) {
            int overWidth = image.getWidth()-dim.width;
            int overHeight = image.getHeight()-dim.height;
            
            if ((overWidth-overHeight)>0) {
                scale = (double) dim.width / (double) image.getWidth();
                scale2 = scale;
            } 
        } else if(isOverWidth) {
            scale = (double) dim.width / (double) image.getWidth();
            scale2 = scale;
        }
        
        int scaledH = (int) (scale * image.getHeight());
        int scaledW = (int) (scale2 * image.getWidth());

        BufferedImage dest = new BufferedImage(scaledW, scaledH, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = dest.createGraphics();
        
        AffineTransform tx = new AffineTransform();
        if (scale < 1.0d) {
            tx.scale(scale2, scale);
        }
        g2.drawImage(image, tx, null);
        g2.dispose();
        return dest;
    }
    
    static public BufferedImage adjustScaleFit(BufferedImage image, Dimension dim) {

        double scale = dim.getHeight() / (double) image.getHeight();
        double scale2 = dim.getWidth() / (double) image.getWidth();
        
        int scaledH = (int) (scale * image.getHeight());
        int scaledW = (int) (scale2 * image.getWidth());

        BufferedImage dest = new BufferedImage(scaledW, scaledH, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = dest.createGraphics();
        
        AffineTransform tx = new AffineTransform();
        if (scale < 1.0d) {
            tx.scale(scale2, scale);
        }
        g2.drawImage(image, tx, null);
        g2.dispose();
        return dest;
    }
    
    static public BufferedImage applyTransparency(BufferedImage image, Image mask) {
        BufferedImage dest = new BufferedImage(image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = dest.createGraphics();
        g2.drawImage(image, 0, 0, null);
        AlphaComposite ac = AlphaComposite.getInstance(AlphaComposite.DST_IN, 1.0F);
        g2.setComposite(ac);
        //위치 설정
        // 좌측 상단
        g2.drawImage(mask, 10, 10, null);

        // 우측 하단
        int w = image.getWidth();
        int h = image.getHeight();
        int iw = mask.getWidth(null)+10;
        int ih = mask.getHeight(null)+6;
        g2.drawImage(mask, w-iw, h-ih, null);

        // 중앙
        int cw = w/2;
        int ch = h/2;
        int ww = iw/2;
        int wh = ih/2;
        g2.drawImage(mask, cw-ww, ch-wh, null);
        g2.dispose();
        return dest;
    }
}
