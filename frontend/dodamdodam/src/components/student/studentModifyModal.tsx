import { Box, Button, Modal, Typography } from "@mui/material";
import React from "react";
import { student } from "@/types/DataTypes";
import { red } from "@mui/material/colors";

export default function StudentModifyModal(props: {
  student: student;
  open: boolean;
  handleOpen: any;
  handleClose: any;
}) {
  const { open, handleClose } = props;
  const style = {
    position: "absolute" as "absolute",
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    width: 500,
    height: 800,
    bgcolor: "background.paper",
    boxShadow: 10,
    p: 3,
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
          <div className="flex flex-col bg-red-200 items-center h-[700px]">
            <div>{props.student.name}</div>
            <div>{props.student.class}</div>
          </div>
        </Box>
      </Modal>
    </div>
  );
}
