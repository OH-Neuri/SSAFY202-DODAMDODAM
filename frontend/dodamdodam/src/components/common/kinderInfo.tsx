import { Modal } from '@mui/material'
import React from 'react'
import UpdateModal from '../user/updateModal';
import { useKindergarten, useModifyKindergarten } from '@/hooks/kindergartenHooks';

export default function KinderInfo(props: {open : boolean, setOpen : any, }) {
    const {open, setOpen} = props;
    const { data } = useKindergarten();
    const { modifyKindergarten } = useModifyKindergarten();
    const modify = (name: string, address: string) => {
        const payload = {
          name: name,
          address: address,
        };
        modifyKindergarten(payload);
        setOpen(false);
      };
  return (
    <Modal
        className="flex justify-center items-center"
        open={open}
        onClose={() => setOpen(false)}
    >
        <div className="flex justify-center items-center outline-none">
        {data &&
        <UpdateModal kinder={data} setOpen={setOpen} modify={modify} />}
        </div>
    </Modal>
  )
}
