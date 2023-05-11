import * as React from "react";
import Box from "@mui/material/Box";
import Modal from "@mui/material/Modal";
import TextField from "@mui/material/TextField";
import { useState, useEffect } from "react";
import axios from "axios";
import Image from "next/image";

export default function studentPhoneInputModal(props: {
  flag: number;
  idx: number;
  open: boolean;
  handleOpen: any;
  handleClose: any;
  children?: React.ReactNode;
  setFlag: any;
}) {
  const { open, handleClose, idx, flag, setFlag } = props;
  const [textValue, setTextValue] = useState<any>("");
  // const [flag, setFlag] = useState<number>(0);

  // 전화번호 입력받기
  const handleTextChange = (event: any) => {
    setTextValue(event.target.value);
  };

  // 전화번호 코드 전송하기
  async function sendPhoneNumber() {
    try {
      var formData = new FormData();
      formData.append("phone", textValue);
      formData.append("kidSeq", props.idx.toString());
      const config = {
        headers: {
          "Content-Type": "application/json",
        },
      };
      const response = axios.post(
        "https://dodamdodam.site/api/dodam/sms/parent",
        formData,
        config
      );
    } catch (error) {
      console.log("post 실패했습니다 조금만 더 힘 내십시오");
    }
    setFlag(1);
  }

  useEffect(() => {
    // setFlag(props.flag);
  }, []);

  // 모달 스타일
  const style = {
    position: "absolute" as "absolute",
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    width: 400,
    height: 320,
    bgcolor: "background.paper",
    border: "2px solid #000",
    boxShadow: 24,
    p: 0,
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
          {props.flag == 0 ? (
            <div className="flex flex-col mt-3  items-center ">
              <div className=" font-preB text-[27px]">
                전화번호를 입력하세요
              </div>
              <div className="w-[300px] flex flex-col mt-9">
                <div className="flex">
                  <TextField
                    sx={{ m: 1, width: 220 }}
                    cursor-pointer
                    id="standard-search"
                    type="search"
                    variant="standard"
                    value={textValue}
                    onChange={handleTextChange}
                    label="ex)01012345678"
                  />
                  <div
                    onClick={() => {
                      setTextValue("");
                      sendPhoneNumber();
                      setFlag(1);
                    }}
                    className="absolute right-[45px] bottom-[134px] w-[60px] h-[50px] hover:bg-[#BF9831] bg-[#FFCD4A] rounded-lg mt-11 text-[18px] flex items-center justify-center font-preR"
                  >
                    전송{" "}
                  </div>
                </div>
                <div className="text-center text-[14px] mt-2">
                  000-0000-0000 형식으로 입력해주세요.
                </div>
              </div>
            </div>
          ) : (
            <div className="flex flex-col mt-3 items-center ">
              <div className=" font-preB text-[28px] mt-20">
                코드를 전송하였습니다.
              </div>
              <div className=" absolute mt-36">
                <Image
                  src="/images/student/send_check.png"
                  alt=""
                  width={60}
                  height={60}
                ></Image>
              </div>
            </div>
          )}
        </Box>
      </Modal>
    </div>
  );
}
