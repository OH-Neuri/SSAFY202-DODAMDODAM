import {
  Box,
  Button,
  Chip,
  InputLabel,
  MenuItem,
  Modal,
  Select,
  SelectChangeEvent,
  Stack,
} from "@mui/material";
import React from "react";
import { useState, useEffect } from "react";
import { student, classList, studentInit } from "@/types/DataTypes";
import DatePicker from "react-datepicker";
import FormControl from "@mui/material/FormControl";
import axios from "axios";
import { useQuery } from "react-query";
import StudentPhoneInputModal from "./studentPhoneInputModal";

export default function StudentModifyModal(props: {
  idx: number;
  open: boolean;
  handleOpen: any;
  handleClose: any;
}) {
  const { open, handleClose, idx } = props;
  const [age, setAge] = useState<string>("");
  const [group, setGroup] = useState<string>("");
  const [name, setName] = useState<string>("");
  const [photo, setPhoto] = useState<any>("");
  const [gender, setGender] = useState<string>("");
  const [startDate, setStartDate] = useState(new Date("2023-05-4"));
  const [student, setStudent] = useState<student>(studentInit);
  const [classList, setClassList] = useState<classList[]>([])
  const [selectedImg, setSelectedImg] = useState<File | null>(null);
  const [isRegisterd, setIsRegisterd] = useState<number>(0);
  const [openPh, setOpenPh] = useState<boolean>(false);

  const handleOpenPh = () => setOpenPh(true);
  const handleClosePh = () => setOpenPh(false);


  // 반 변경 저장
  const handleChangeGroup = (event: SelectChangeEvent) => {
    setGroup(event.target.value);
  };

  // 성별 변경 저장
  const handleChangeGender = (event: SelectChangeEvent) => {
    setGender(event.target.value);
  };

  // 아이 수정하기 
  async function getModifyKidInfo() {
    
    const changeDate = new Date(startDate)
    const year = changeDate.getFullYear()
    const month = changeDate.getMonth() + 1
    const date = changeDate.getDate()
    const resultDate = `${year}-${month >= 10 ? month : '0' + month}-${date >= 10 ? date : '0' + date}`

    try {
      var formData = new FormData();
      formData.append('kidSeq', student.kidSeq.toString());
      formData.append('kidName', name);
      formData.append('birth', resultDate);
      if (!selectedImg) {
        // 이미지가 그대로면 null 
        formData.append('photo', new Blob())
      } else {
        // 이미지가 바뀌면 selectedImg
        formData.append('photo', selectedImg);
      }
      formData.append('gender', gender);
      formData.append('classSeq', student.classSeq.toString());
      const config = {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      };
      const response =  axios.put('https://dodamdodam.site/api/dodam/kindergarten/kid', formData, config);
    } catch (error) { 
      console.log("post 실패했습니다 조금만 더 힘 내십시오")
    }

  }

  // 아이 가져오기
  async function fetchKid(idx: number) {
    // API 38번
    const kidSeq = idx;
    try {
      const response = await axios.get(
        `https://dodamdodam.site/api/dodam/kindergarten/kidInfo/${kidSeq}`
      );
      setStudent(response.data.result);
    } catch (error) {
      console.log("에러났습니다.");
    }
  }

  // 아이 삭제하기
  async function deleteKid(idx: number) { 
      const kidSeq = idx;
      try {
        const response = await axios.delete(
          `https://dodamdodam.site/api/dodam/kindergarten/kid/${kidSeq}`
        );
        console.log(`원생삭제 :>>>>>>>>>>>`);
        console.log(response.data.result);
      } catch (error) {
        console.log("원생 삭제에서 에러났습니다.???????????????????????????????????//");
      }
  }
  
  // 반 이름 가져오기
  async function getClassName() {
    try {
      const response = await axios.get(
        `https://dodamdodam.site/api/dodam/kindergarten/class`
      );
      setClassList(response.data.result);
      
    } catch (error) {
      console.log("에러났습니다.");
    }
  }


  useEffect(() => {
    fetchKid(props.idx)
    getClassName()
    setName(student.kidName);
    setStartDate(new Date(`${student.birth}`));
    setPhoto(student.photo);
    setGroup(student.className);
    setGender(student.gender);
    setIsRegisterd(student.parentSeq);
    // setIsRegiseterd()
  }, [props]);



  // 모달 스타일
  const style = {
    position: "absolute" as "absolute",
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    width: 500,
    height: 800,
    bgcolor: "background.paper",
    boxShadow: 100,
    p: 3,
  };


  // 파일 업로드
  const onUpload = (e: any) => {
    const file = e.target.files[0];
    const reader = new FileReader();
    setSelectedImg(file);
    reader.readAsDataURL(file);

    return new Promise<void>((resolve) => {
      reader.onload = () => {
        setPhoto(reader.result || null); // 파일의 컨텐츠
        resolve();
      };
    });
  };


  return (
    <div>
      <Modal
        open={open}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <div className="flex flex-col mt-10  items-center h-[700px]">
            <div className=" font-preB text-[33px]">원생 수정하기</div>

            {/* 원생 사진 */}
            <div className="cursor-pointer mt-14 relative mt- w-[150px] h-[150px] ">
              <input
                className=" cursor-pointer  fixed opacity-0 w-[150px] h-[150px] rounded-full bg-red-300"
                accept="image/*"
                multiple
                type="file"
                onChange={(e) => onUpload(e)}
              />
              <div className="w-[150px] h-[150px] rounded-full overflow-hidden">
                <img
                  className="w-full h-full object-cover"
                  src={photo==null||photo=='DF'?'images/student/boy.png':photo}
                  alt=""
                  width={150}
                  height={150}
                />
              </div>
              <div className="shadow-md flex justify-center items-center absolute w-[40px] h-[40px] rounded-full bg-white left-[100px] bottom-[-12px]">
                <img
                  src="images/student/pencil.png"
                  alt=""
                  width={27}
                  height={27}
                />
              </div>
            </div>

            {/* 원생 이름 */}
            <div className="pt-[30px] w-[340px]">
              <div className="pl-[10px]">이름</div>
              <input
                value={name}
                className="ml-[5px] outline-none border border-[#BEBEBE] w-[340px] h-[43px] rounded-lg px-4"
                type="text"
                onChange={(e) => setName(e.target.value)}
              ></input>
            </div>
            <div className="pt-[20px] w-[340px]">
              <div className="flex">

            {/* 원생 나이 */}
                <div>
                  <div className="ml-[5px]">생년월일</div>
                  <div className="ml-[5px] mt-[3px]  w-[150px] h-[60px]">
                    <DatePicker
                      className="outline-none w-[160px] mt-[4px] h-[42px] text-[18px] border-[1.5px] border-gray-300 pl-[17px] rounded-lg"
                      selected={startDate}
                      onChange={(date: any) => setStartDate(date)}
                      dateFormat="yyyy-MM-dd"
                    />
                  </div>
                </div>
                <div>
                  <div className="ml-[37px] "> 성별 </div>
                  <div className="ml-[23px]">
                    <FormControl sx={{ m: 1, minWidth: 160 }} size="small">
                      <InputLabel htmlFor="grouped-select"></InputLabel>
                      <Select
                        id="grouped-select"
                        value={gender}
                        onChange={handleChangeGender}
                      >
                      <MenuItem value='F'>여자</MenuItem>
                      <MenuItem value='M'>남자</MenuItem>
                        
                      </Select>
                    </FormControl>
                  </div>
                </div>
              </div>

              {/* 원생 반 */}
              <div className="w-[340px] pt-[17px]">
                <div className="pl-[10px]">반</div>
                <div className="ml-[0px]">
                  <FormControl sx={{ m: 1, minWidth: 340 }} size="small">
                    <InputLabel htmlFor="grouped-select"></InputLabel>
                    <Select
                      id="grouped-select"
                      value={group}
                      onChange={handleChangeGroup}
                    >
                      {/* 반 리스트만큼 map돌고 value가 반 이름이면 되고, group에 학생 반 넣으면 됨 */}
                      {
                        classList.map((v,i) => { 
                          return (
                              <MenuItem key={i} value={v.className}>{v.className}</MenuItem>
                          )
                        })
                      } 
                    </Select>
                  </FormControl>
                </div>
              </div>
              <div className="flex mt-[20px]">
                {isRegisterd != 0 ?
                <div className="flex">
                  <div
                    onClick={() => { 
                      handleClose();
                      getModifyKidInfo();
                    }
                    }
                    className="cursor-pointer hover:bg-[#BF9831] flex justify-center items-center text-[20px] font-preM ml-3 w-[165px] h-[50px] bg-[#FFCD4A] rounded-lg mt-11"
                  >
                    저장하기
                  </div>
                  <div
                    onClick={() => { handleClose(); deleteKid(props.idx); }}
                    className="cursor-pointer hover:bg-[#9A9A9A] flex justify-center items-center text-[20px] font-preM ml-3 w-[165px] h-[50px] bg-[#CACACA] rounded-lg mt-11"
                  >
                    삭제하기
                  </div>
                </div>
                  :
                  <div className="flex">
                    <div
                      onClick={() => { 
                        handleClose();
                        getModifyKidInfo();
                      }
                      }
                      className="cursor-pointer hover:bg-[#BF9831] flex justify-center items-center text-[15px] font-preM ml-3 w-[103px] h-[50px] bg-[#FFCD4A] rounded-lg mt-11"
                    >
                      저장하기
                    </div>
                    <div
                      onClick={() => {handleOpenPh() }}
                      className="cursor-pointer hover:bg-[#D76861] flex justify-center items-center text-[15px] font-preM ml-3 w-[103px] h-[50px] bg-[#FF655B] rounded-lg mt-11"
                    >
                      코드전송
                    </div>
                    <div
                      onClick={() => { handleClose(); deleteKid(props.idx); }}
                      className="cursor-pointer hover:bg-[#9A9A9A] flex justify-center items-center text-[15px] font-preM ml-3 w-[103px] h-[50px] bg-[#CACACA] rounded-lg mt-11"
                    >
                      삭제하기
                    </div>
                    <StudentPhoneInputModal
                      idx={props.idx}
                      open={openPh}
                      handleOpen={handleOpenPh}
                      handleClose={handleClosePh}>
                    </StudentPhoneInputModal>
                  </div>
                }
              </div>
            </div>
          </div>
        </Box>
      </Modal>
    </div>
  );
}