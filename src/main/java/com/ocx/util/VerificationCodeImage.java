package com.ocx.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class VerificationCodeImage {

	private static final int WIDTH = 70;
	private static final int HEIGHT = 25;
	private static final Font mFont = new Font("Times New Roman", Font.PLAIN, 17);
	private static final String[] CODES = new String[] { "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M",
			"N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "1", "2", "3", "4", "5", "6", "7", "8", "9" };

	public static Map createImage() {

		// 生成随机数,并将随机数字转换为字母
		String sRand = "";

		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();

		try {

			Random random = new Random();
			g.setColor(getRandColor(200, 250));
			g.fillRect(1, 1, WIDTH - 1, HEIGHT - 1);
			g.setColor(new Color(102, 102, 102));
			g.drawRect(0, 0, WIDTH - 1, HEIGHT - 1);
			g.setFont(mFont);

			g.setColor(getRandColor(160, 200));

			// 画随机线
			for (int i = 0; i < 155; i++) {
				int x = random.nextInt(WIDTH - 1);
				int y = random.nextInt(HEIGHT - 1);
				int xl = random.nextInt(6) + 1;
				int yl = random.nextInt(12) + 1;
				g.drawLine(x, y, x + xl, y + yl);
			}

			// 从另一方向画随机线
			for (int i = 0; i < 70; i++) {
				int x = random.nextInt(WIDTH - 1);
				int y = random.nextInt(HEIGHT - 1);
				int xl = random.nextInt(12) + 1;
				int yl = random.nextInt(6) + 1;
				g.drawLine(x, y, x - xl, y - yl);
			}

			for (int i = 0; i < 4; i++) {
				int itmp = random.nextInt(32);
				sRand += CODES[itmp];
				g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
				g.drawString(CODES[itmp], 15 * i + 10, 16);
			}

		} finally {
			if (null != g) {
				g.dispose();
			}
		}

		Map map = new HashMap();
		map.put("codes", sRand);
		map.put("image", image);
		return map;
	}

	private static Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	public static void main(String[] args) {

		System.out.println(CODES.length);
		for (int i = 0; i < 33332; i++) {
			Random random = new Random();
			int a = random.nextInt(33);
			if (a == 0) {
				System.out.println(a);

			}

		}
	}
}
