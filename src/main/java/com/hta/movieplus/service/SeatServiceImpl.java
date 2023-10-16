package com.hta.movieplus.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hta.movieplus.controller.ManagerController;


@Service
public class SeatServiceImpl implements SeatService {

	private static final Logger logger = LoggerFactory.getLogger(SeatServiceImpl.class);

	public static String[] alps = { "A", "B", "C", "D", "E", "D", "F", "G", "H", "J", "K", "L", "M" };

	@Override
	public int getSeatCount(String seatStr) {
		// TODO Auto-generated method stub
		List<Integer> indexList = getIndexList(seatStr);

		int x = getX(indexList, seatStr);
		int y = getY(seatStr);

		return x * y - (indexList.size() - 1);
	}

	@Override
	public String makeSeatStr(String seatStr) {
		// TODO Auto-generated method stub
		int column_y_position = 52;
		int seat_x_position = 161;
		int seat_y_position = 50;

		int alpIndex = -1;
		int seatIndex = -1;
		
//		String selectionType = "";
//		boolean selectionChk = true;
		
		List<Integer> indexList = getIndexList(seatStr);
		List<String> deletedSeatList = new ArrayList<String>(); 

		
		for (int i = 0; i < indexList.size(); i++) {
			if(i==indexList.size()-1) {
				deletedSeatList.add(seatStr.substring(indexList.get(i), seatStr.length()));
				break;
			}
			deletedSeatList.add(seatStr.substring(indexList.get(i), indexList.get(i + 1)));

		}

		StringBuilder sb = new StringBuilder();

		int x = getX(indexList, seatStr);
		int y = getY(seatStr);
		
		
		//x가 작을수록 seatxposition이 커져야함
		//20개일때 161, 8개일때 251 / 90  
		//

		for (int i = 0; i < y; i++) {
			seat_x_position = (int) (161 + (7.5 * (20-x)));
			sb.append(
					"<button type='button' class='btn-seat-row' title='A 행' style='position: absolute; left: 106px; top: "
							+ column_y_position + "px;'>" + alps[i] + "</button>");

			for (int j = 1; j <= x; j++) {
				
//				if(selectionChk) {
//					selectionType = "solo";
//				}else {
//					selectionType = "duo";
//				}
//				
				if (j == 7 || j == 17) {
					seat_x_position += 20;
				}
				
				if(checkDeletedSeat(j, i, deletedSeatList)) {
					seat_x_position += 20;
					continue;
				}
				sb.append("<button type='button' title='" + alps[i] + j + " (스탠다드/장애인석)' data-seat-num='" + alps[i] + j
						+ "' class='jq-tooltip seat-condition standard common' style='position: absolute; left: "
						+ seat_x_position + "px; top: " + seat_y_position + "px; width: 20px;'>\r\n"
						+ "<span class='num'>" + j
						+ "</span><span class='kind'>스탠다드</span><span class='condition'>판매가능</span><span class='rank'>장애인석</span>");
				seat_x_position += 20;
				
//				selectionChk = !selectionChk;
			}
			seat_y_position += 20;
			column_y_position += 20;
		}

		
		return sb.toString();
	}

	public int getAlpIndex(String alpInput) {

		for (int i = 0; i < alps.length; i++) {
			if (alps[i].equals(alpInput)) {
				return i + 1;
			}
		}

		return 0;
	}

	public int getY(String input) {
		return getAlpIndex(input.substring(0, 1));
	}

	public int getX(List<Integer> indexList, String input) {

		int result = 0;

		if (indexList.size() == 1) {
			result = Integer.parseInt(input.substring(1, input.length()));
		} else {
			result = Integer.parseInt(input.substring(1, indexList.get(1)));
		}

		return result;
	}

	public List<Integer> getIndexList(String seatStr) {
		String pattern = "^[A-Z]$";
		String splits[] = seatStr.split("");

		List<Integer> indexList = new ArrayList<Integer>();

		for (int i = 0; i < splits.length; i++) {
			if (splits[i].matches(pattern)) {
				indexList.add(i);
			}
		}

		return indexList;
	}
	
	public boolean checkDeletedSeat(int x, int y, List<String> deletedSeatList) {
		StringBuilder sb2 = new StringBuilder();
		sb2.append(alps[y]);
		sb2.append(x);
		
		for(String seat : deletedSeatList) {
			if(seat.equals(sb2.toString())) {
				return true;
			}
			
		}
		
		
		return false;
	}

}
