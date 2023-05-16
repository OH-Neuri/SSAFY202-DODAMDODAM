import { classificationType } from "@/types/calendarType";
import { Modal, Box } from "@mui/material";
import React, { useState, useEffect } from "react";

export default function CalendarTypeModal(props: {
  typeList: classificationType[];
  open: boolean;
  handleClose: any;
}) {
  const { typeList, open, handleClose } = props;

  // 중간 중간 갈아끼울 리스트
  const [newList, setNewList] = useState<classificationType[]>(typeList);
  useEffect(() => {
    setNewList(typeList);
  }, [props]);

  // 쌓이는 스택 (저장 -> API 요청)
  const [stackList, setStackList] = useState<classificationType[]>([]);

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

  // 모달
  return (
    <div>
      <Modal open={open} onClose={handleClose}>
        <Box sx={style}>
          <div>체키라웃</div>
          <div onClick={handleClose}>등록하기</div>
          <div onClick={handleClose}>삭제하기</div>
        </Box>
      </Modal>
    </div>
  );
}
