import React, { useState, useEffect } from "react";

export default function CalendarTypeModal(props: {
  typeList: string[];
  open: boolean;
  handleOpen: any;
  handleClose: any;
}) {
  const { typeList, open, handleOpen, handleClose } = props;

  // 갈아끼울 리스트
  const [newList, setNewList] = useState<string[]>(typeList);
  useEffect(() => {}, [props]);

  // 모달

  return <div>calendarTypeModal</div>;
}
