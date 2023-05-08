import {
  Box,
  InputLabel,
  MenuItem,
  Modal,
  Select,
  SelectChangeEvent,
  TextField,
} from "@mui/material";
import React from "react";
import { useState } from "react";
import FormControl from "@mui/material/FormControl";
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';


export default function StudentRegisterModal(props: {
  open: boolean;
  handleOpen: any;
  handleClose: any;
}) {


  const { open, handleClose } = props;
  const [group, setGroup] = React.useState<string>("");
  const [name, setName] = React.useState<string>("");
  const [imageSrc, setImageSrc]: any = useState("images/student/boy.png");
  const [gender, setGender] = useState<string>("");
  const [startDate, setStartDate] = useState(new Date());
  const groupName = ["햇살반", "새싹반", "나무반", "구름반"];
  const genders = ["여자", "남자"];



  const handleChangeGroup = (event: SelectChangeEvent) => {
    setGroup(event.target.value);
  };

  const handleChangeGender = (event: SelectChangeEvent) => {
    setGender(event.target.value);
  };
  

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
    reader.readAsDataURL(file);

    return new Promise<void>((resolve) => {
      reader.onload = () => {
        setImageSrc(reader.result || null); // 파일의 컨텐츠
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
            <div className=" font-preB text-[33px]">원생 등록하기</div>
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
                  src={imageSrc}
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
            <div className="pt-[30px] w-[340px]">
              <div className="ml-[10px]" >이름</div>
              <input
                className="outline-none border border-gray-300 w-[345px] h-[40px] rounded-lg px-4"
                type="text"
                onChange={(e) => setName(e.target.value)}
              ></input>
            </div>
            <div className="pt-[20px] w-[340px] flex">
              <div>
                <div className="ml-[5px]">생년월일</div>
                <div className="mt-[3px]  w-[150px] h-[60px]">
                  <DatePicker 
                    className="outline-none w-[160px] mt-[4px] h-[42px] text-[20px] border-[1.5px] border-gray-300 pl-[17px] rounded-lg"
                    selected={startDate}
                    onChange={(date:any) => setStartDate(date)}
                    dateFormat="yyyy-MM-dd"
                />
                </div>
              </div>
              <div>
                <div className="ml-[37px] "> 성별 </div>
                <div className="ml-[23px]">
                  <FormControl  sx={{ m: 1, minWidth: 160 }} size="small">
                    <InputLabel htmlFor="grouped-select"></InputLabel>
                    <Select
                      id="grouped-select"
                      value={gender}
                      onChange={handleChangeGender}
                    >
                      {genders.map((v, i) => {
                        return (
                          <MenuItem key={i} value={v}>
                            {v}
                          </MenuItem>
                        );
                      })}
                    </Select>
                  </FormControl>
                </div>
              </div>
            </div>
            <div className="w-[350px] pt-[17px]">
              <div className="ml-[10px]">반</div>
              <div >
                <FormControl sx={{ m: 1, minWidth: 340 }} size="small">
                  <InputLabel htmlFor="grouped-select"></InputLabel>
                  <Select
                    id="grouped-select"
                    value={group}
                    onChange={handleChangeGroup}
                  >
                    {groupName.map((v, i) => {
                      return (
                        <MenuItem key={i} value={v}>
                          {v}
                        </MenuItem>
                      );
                    })}
                  </Select>
                </FormControl>
              </div>
            </div>
            <div
              onClick={handleClose}
              className="cursor-pointer hover:bg-[#BF9831] flex justify-center items-center text-[20px] font-preM ml-3 w-[340px] h-[55px] bg-[#FFCD4A] rounded-lg mt-11"
            >
              등록하기
            </div>
          </div>
        </Box>
      </Modal>
    </div>
  );
}
