import { Box, Button, Chip, InputLabel, MenuItem, Modal, Select, SelectChangeEvent, Stack, TextField, Typography } from '@mui/material'
import React from 'react'

export default function StudentRegisterModal(props: {open:boolean, handleOpen: any, handleClose: any }) {
  const {open, handleOpen, handleClose} = props
  const [age, setAge] = React.useState('');
  const handleClick = () => {
    
  };


  const style = {
    position: 'absolute' as 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: 500,
    height: 800,
    bgcolor: 'background.paper',
    boxShadow: 100,
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
          <div className='flex flex-col mt-7 bg-red-200 items-center h-[700px]'>
            <div className='font-preB text-[30px]'>
              원생 등록하기
            </div>
            <div>
              
            </div>
            <div>
              <div>이름</div>
              <div><TextField id="filled-basic" label="홍길동" variant="filled" size="small" /></div>
            </div>
            <div>
              <div>나이</div>
              <div>
              <Stack direction="row" spacing={2}>
                <Chip label="3세 이하"  variant="outlined" onClick={handleClick} />
                <Chip label="4세" variant="outlined" onClick={handleClick} />
                <Chip label="5세" variant="outlined" onClick={handleClick} />
                <Chip label="6세" variant="outlined" onClick={handleClick} />
                <Chip label="7세" variant="outlined" onClick={handleClick} />
              </Stack>        
              </div>
            </div>
            <div>
              <div></div>
              <div></div>
            </div>
            <Typography id="modal-modal-description" sx={{ mt: 2 }}>
            Duis mollis, est non commodo luctus, nisi erat porttitor ligula.
          </Typography>
        </div>  
      </Box>
    </Modal></div>
  )
}
