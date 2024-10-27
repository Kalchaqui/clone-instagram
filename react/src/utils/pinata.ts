import { PinataSDK } from "pinata-web3";

const PINATA_JWT= import.meta.env.VITE_PINATA_JWT || ""
const GATEWAY_IPFS= import.meta.env.VITE_GATEWAY_IPFS || ""

if(!PINATA_JWT || !GATEWAY_IPFS){
    throw new Error("env variables not set")
}

const pinata = new PinataSDK({
    pinataJwt: PINATA_JWT

})
export async function uploadFile(file: File) {
    try {
        const upload = await pinata.upload.file(file)
        console.log(upload)
        return upload.IpfsHash
    } catch (error) {
        console.error(error)
        
        
    }
}

export async function uploadMetadataToPinata(
    name: string,
    description: string,
    imageUrl: string,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    attributes?: Record<string, any>[]
){
    try {
        const upload = await pinata.upload.json({
            name: name,
            description: description,
            image: imageUrl,
            attributes: attributes
        })

        console.log(upload)// Imprime el objeto completo
        return `${GATEWAY_IPFS}${ upload.IpfsHash}`      
    } catch (error) {
        console.log(error)
        
    }
}
 
 export async function getMetadata(){
    const data = await fetch(``)
    return data;
 }
      
      
      
      
      
      
      
   
   