<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="title" value="스포츠 장비 수정" />
<c:set var="description" value="스포츠 장비의 이름, 가격, 상태를 수정할 수 있는 사이트" />
<c:set var="keywords" value="장비,소모품,수정" />

<c:set var="body">
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

	<!-- 장비정보 수정 폼 -->
	<el-form label-position="right" ref="form" label-width="150px" status-icon class="max-w-lg"
			 action="${ctp}/sportsEquipment/updateSportsEquipment" enctype="multipart/form-data" method="post" id="updateSportsEquipmentForm">
		<el-form-item label="이름">
			<el-input type="text" v-model="model.itemName" name="itemName"/>			
		</el-form-item> 

		<el-form-item label="가격">
			<el-input type="number" v-model="model.itemPrice" name="itemPrice" />			
		</el-form-item> 
		
		<el-form-item label="상태">
			<el-radio-group v-model="model.equipmentActive" name="equipmentActive" class="ml-4" >
				<el-radio label="Y">주문가능</el-radio>
				<el-radio label="N">품절</el-radio>
			</el-radio-group>
		</el-form-item>

		<el-form-item label="관리자">
			<el-input type="text" v-model="model.employeeId" name="employeeId" readonly="readonly" />			
		</el-form-item>

		<el-form-item label="등록일">
			<el-input type="text" v-model="model.equipmentCreatedate" name="equipmentCreatedate" readonly="readonly" />			
		</el-form-item>
		
		<el-form-item label="수정일">
			<el-input type="text" v-model="model.equipmentUpdatedate" name="equipmentUpdatedate" readonly="readonly" />			
		</el-form-item>
		<input type="hidden" name="sportsEquipmentNo" :value="model.sportsEquipmentNo">
		<el-form-item>
			<el-button type="primary" @click="updateSubmit(form)">수정</el-button>
		</el-form-item> 
	</el-form>
	
   <!-- 장비 이미지 삭제 폼 -->
	<el-row :gutter="20">
	  <el-col :span="20" v-for="(img, index) in model.sportsEquipmentImgList" :key="index">
	    <el-card :label="img.sportsEquipmentImgNo" :body-style="{ padding: '15px' }">
	      <div style="padding: 14px">
	        <img :src="'/finalP/upload/sportsEquipment/' + img.sportsEquipmentImgFileName" class="image" style="width: 300%; height: 400px;"/>
	      </div>
	      <el-form label-position="right" ref="form" label-width="150px" status-icon class="max-w-lg"
	               action="${ctp}/sportsEquipment/deleteOneSportsEquipmentImg" enctype="multipart/form-data" method="post" id="deleteEquipmentImgForm">
	        <el-form-item label="이미지">
	        	<span>파일네임 : {{ img.sportsEquipmentImgFileName }}</span><br>
  				<input type="hidden" name="sportsEquipmentNo" :value="model.sportsEquipmentNo">
	          	<input type="hidden" name="sportsEquipmentImgFileName" v-model="img.sportsEquipmentImgFileName" @input="updateImageFileName(index, $event)">
	          	<input type="hidden" name="sportsEquipmentImgNo" v-model="img.sportsEquipmentImgNo">
	        </el-form-item>
	        <el-form-item>
	          <el-button type="primary" @click="deleteSubmit(form)">삭제</el-button>
	        </el-form-item>
	      </el-form>
	    </el-card>
	  </el-col>
	</el-row>

	
	<!-- 장비이미지 추가 폼 -->
	<el-form label-position="right" ref="form" label-width="150px" status-icon class="max-w-lg"
	         action="${ctp}/sportsEquipment/insertOneSportsEquipmentImg" enctype="multipart/form-data" method="post" id="insertOneSportsEquipmentImg">
	
	 	<el-form-item label="이미지">
			<el-input type="file" v-model="model.sportsEquipmentImg" name="sportsEquipmentImg" multiple  />			
		</el-form-item> 
	
	  	<input type="hidden" name="sportsEquipmentNo" :value="model.sportsEquipmentNo">
	
	  	<el-form-item>
	    	<el-button type="primary" @click="insertSubmit(form)">추가</el-button>
	  	</el-form-item>
	
	</el-form>
	
</c:set>
<c:set var="script">
	data() {
	  	return {
	  			model: {
	    
	    			sportsEquipmentNo: '${sportsEquipmentNo}', 
				    itemPrice: '${itemPrice}',
				    employeeId: '${employeeId}',
				    itemName: '${itemName}',
				    equipmentActive: '${equipmentActive}',
				    equipmentCreatedate: '${equipmentCreatedate}',
				    equipmentUpdatedate: '${equipmentUpdatedate}',
				    sportsEquipmentImgList: JSON.parse('${sportsEquipmentImgList}'),
				    sportsEquipmentImg: [],		     
	  			}
			}
		},
	
	methods: {
	
		insertSubmit(){
			document.getElementById('insertOneSportsEquipmentImg').submit();
		},
		
		deleteSubmit(){
			document.getElementById('deleteEquipmentImgForm').submit();
		},
		
		updateSubmit() {
			document.getElementById('updateSportsEquipmentForm').submit();
		},
		
		updateImageFileName(index, event) {
    		this.$set(this.model.sportsEquipmentImgList, index, {
      		...this.model.sportsEquipmentImgList[index],
      		sportsEquipmentImgFileName: event.target.value
    });
  },
		
	}
</c:set>

<%@ include file="/inc/admin_layout.jsp"%>