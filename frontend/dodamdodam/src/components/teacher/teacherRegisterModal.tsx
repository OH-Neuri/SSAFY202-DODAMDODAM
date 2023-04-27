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
  TextField,
  Typography,
} from "@mui/material";
import React from "react";
import { useState } from "react";

import FormControl from "@mui/material/FormControl";
export default function StudentRegisterModal(props: {
  open: boolean;
  handleOpen: any;
  handleClose: any;
}) {
  const { open, handleClose } = props;
  const [group, setGroup] = React.useState("");
  const [name, setName] = React.useState("");
  // 반 목록
  const groupName = ["햇살반", "새싹반", "나무반", "구름반"];
  const handleChange = (event: SelectChangeEvent) => {
    setGroup(event.target.value);
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
            <div className=" font-preB text-[33px]">교사 등록하기</div>
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
                  src="/images/teacher/teacher.png"
                  alt=""
                  width={150}
                  height={150}
                />
              </div>
            </div>
            <div className="pt-[30px] w-[340px]">
              <div className="pl-[9px]">이름</div>
              <input
                className="outline-none border border-[#C6C6C6] w-[345px] h-[40px] rounded-md px-4"
                type="text"
                onChange={(e) => setName(e.target.value)}
              ></input>
            </div>
            <div className="pt-[20px] w-[340px]">
              <div className="mt-[3px]"></div>
            </div>
            <div className="w-[375px] pt-[17px] pl-[13px]">
              <div className="pl-[13px]">반</div>
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
              className=" cursor-pointer hover:bg-[#BF9831] flex justify-center items-center text-[20px] font-preM ml-3 w-[340px] h-[55px] bg-[#FFCD4A] rounded-lg mt-20"
            >
              등록하기
            </div>
          </div>
        </Box>
      </Modal>
    </div>
  );
}
