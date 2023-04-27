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
import { useState,useEffect } from "react";
import { student } from "@/types/DataTypes";

import FormControl from "@mui/material/FormControl";
export default function StudentRegisterModal(props: {
  student: student;
  open: boolean;
  handleOpen: any;
  handleClose: any;
}) {
  const { open, handleClose } = props;
  const [age, setAge] = React.useState(3);
  const [group, setGroup] = React.useState("");
  const [name, setName] = React.useState("");
  const [imageSrc, setImageSrc]: any = useState("");
  // 반 목록
  const groupName = ["햇살반", "새싹반", "나무반", "구름반"];
  const handleChange = (event: SelectChangeEvent) => {
    setGroup(event.target.value);
  };

  useEffect(() => {
    setName(props.student.name)
    setAge(props.student.age)
    setImageSrc(props.student.image)
    setGroup(props.student.class)

  },[props])

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

          {/* 원생 이름 */}
            <div className="pt-[30px] w-[340px]">
              <div>이름</div>
              <input
                value={name}
                className="outline-none border border-gray-300 w-[345px] h-[43px] rounded-lg px-4"
                type="text"
                onChange={(e) => setName(e.target.value)}
              ></input>
            </div>
            <div className="pt-[20px] w-[340px]">

          {/* 원생 나이 */}
              <div>나이</div>
              <div className="mt-[3px]">
                {props.student.age}
                
                <Stack direction="row" spacing={3}>
                  <Chip
                    className="text-black"
                    label="3세 이하"
                    color="primary"
                    variant={age == 3 ? "filled" : "outlined"}
                    onClick={() => setAge(3)}
                  />
                  <Chip
                    className="text-black"
                    label="4세"
                    color="primary"
                    variant={age == 4 ? "filled" : "outlined"}
                    onClick={() => setAge(4)}
                  />
                  <Chip
                    className="text-black"
                    label="5세"
                    color="primary"
                    variant={age == 5 ? "filled" : "outlined"}
                    onClick={() => setAge(5)}
                  />
                  <Chip
                    className="text-black"
                    label="6세"
                    color="primary"
                    variant={age == 6 ? "filled" : "outlined"}
                    onClick={() => setAge(6)}
                  />
                  <Chip
                    className="text-black"
                    label="7세"
                    color="primary"
                    variant={age == 7 ? "filled" : "outlined"}
                    onClick={() => setAge(7)}
                  />
                </Stack>
              </div>
            </div>

          {/* 원생 반 */}
            <div className="w-[340px] pt-[17px]">
              <div className="">반</div>
              <div className="ml-[0px]">
                <FormControl sx={{ m: 1, minWidth: 340 }} size="small">
                  <InputLabel htmlFor="grouped-select"></InputLabel>
                  <Select
                    id="grouped-select"
                    value={group}
                    onChange={handleChange}
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
