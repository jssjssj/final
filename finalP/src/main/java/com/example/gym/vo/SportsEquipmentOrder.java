package com.example.gym.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class SportsEquipmentOrder {
	private int orderNo;
	private int branchNo;
	private int sportsEquipmentNo;
	private int quantity;
	private int totalPrice;
	private String createdate;
	private String updatedate;
	private String orderStatus;
}