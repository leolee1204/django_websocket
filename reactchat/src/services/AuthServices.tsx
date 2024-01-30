import axios from "axios";
import { AuthServiceProps } from "../@types/auth-service";
import { useState } from "react";

export function useAuthService(): AuthServiceProps {
    const getInitialLoggedInValue = () => {
        const LoggedIn = localStorage.getItem("isLoggedIn");
        return LoggedIn !== null && LoggedIn === "true";
    };

    const [isLoggedIn, setIsLoggedIn] = useState<boolean>((getInitialLoggedInValue))

    const getUserDetails = async () =>{
        try {
            const userId = localStorage.getItem("userId")
            const accessToken = localStorage.getItem("access_token")
            console.log(">>>>>>>")
            console.log(accessToken)
            
            const response = await axios.get(
                `http://127.0.0.1:8000/api/account/?user_id=${userId}`,{ 
                headers:{
                    Authorization: `Bearer ${accessToken}`
                }
            });
            const userDetails = response.data
            localStorage.setItem("username",userDetails.username)
            setIsLoggedIn(true);
            localStorage.setItem("isLoggedIn", "true")

        } catch (err:any) {
            setIsLoggedIn(false)
            localStorage.setItem("isLoggedIn", "false")
            return err;
        }
    }
    
    const getUserIdFromToken = (access: string) => {
        const token = access
        const tokenParts = token.split('.')
        const encodePayLoad = tokenParts[1]
        const decodePayLoad = atob(encodePayLoad)
        const payLoadData = JSON.parse(decodePayLoad)
        const userId = payLoadData.user_id

        return userId
    }
    
    const login = async (username: string, password:string) =>{
        try {
            const response = await axios.post(
                "http://127.0.0.1:8000/api/token/",{
                    username,
                    password,
                }
            );

            const { access, refresh } = response.data;

            localStorage.setItem("access_token",access)
            localStorage.setItem("refresh_token",refresh)
            localStorage.setItem("userId",getUserIdFromToken(access))
            localStorage.setItem("isLoggedIn","true")
            setIsLoggedIn(true)
            getUserDetails()

        } catch (err:any) {
            return err;
        }

    }

    const logout = () => {
        localStorage.removeItem("access_token");
        localStorage.removeItem("refresh_token");
        localStorage.removeItem("userId");
        localStorage.removeItem("username");
        localStorage.setItem("isLoggedIn","false")
        setIsLoggedIn(false);
    }

    return {login, isLoggedIn, logout}
}