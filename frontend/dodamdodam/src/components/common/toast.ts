import { toast, ToastPosition } from 'react-toastify'

export const toastError = (content: string) => {
    return (
        toast.error(content, {
            position: 'top-right',
            autoClose: 1500,
            hideProgressBar: true,
            closeOnClick: true,
            pauseOnHover: false,
            draggable: true,
            progress: undefined,
            theme: "colored",
            icon: '🚨',
            })
    )
}

export const toastOK = (content: string) => {
    return (
        toast.info(content, {
            position: 'top-right',
            autoClose: 1500,
            hideProgressBar: true,
            closeOnClick: true,
            pauseOnHover: false,
            draggable: true,
            progress: undefined,
            theme: "colored",
            icon: '⭐',
            })
    )
}
