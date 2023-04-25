import { Box, Button, Modal, Typography } from '@mui/material'
import React from 'react'

export default function StudentModifyModal(props: {header:string}) {
  const [open, setOpen] = React.useState(false);
  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);

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
          <div className='flex flex-col bg-red-200 items-center h-[700px]'>
            <div>
                {props.header}
            </div>            
            <Typography id="modal-modal-description" sx={{ mt: 2 }}>
            Duis mollis, est non commodo luctus, nisi erat porttitor ligula.
          </Typography>
        </div>  
      </Box>
    </Modal></div>
  )
}
