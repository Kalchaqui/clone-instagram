import React from "react";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import{
    Card,
    CardContent,
    CardHeader,
    CardTitle,
    CardFooter,
} from "@/components/ui/card";
import { Image, Film, ImagePlus, ArrowRight, ArrowLeft } from "lucide-react";
import { useNavigate } from "react-router-dom";

const Create: React.FC = () => {
    const [selectedOpction, setSelectedOpction] = useState<string | null>(null);

    const navigate = useNavigate();

    const handleOptionClick = (option: string) => {
        setSelectedOpction (option);
    };

    const handleNext = () => {
        if(selectedOpction){ 
            navigate(selectedOpction);
        }
    
    };


    const handlePrevious = () => {
        navigate("/");

    };



    return (
        <>
        <Card className="w-full max-w-md mx-auto mt-2">
        <Button className="w-full"
        onClick={handlePrevious}>
          <ArrowLeft className="w-4 h-4" />
          Volver
        </Button>
      </Card>
      
      <Card className="w-full max-w-md mx-auto mt-2">
        <CardHeader>
          <CardTitle className="text-2xl font-bold text-center">
            Crear Nuevo Post
          </CardTitle>
        </CardHeader>
      
        <CardContent className="grid gap-4">
          <Button 
          variant={selectedOpction ==="images" ? "default" : "outline"}
          className="flex items-center justify-start h-16 text-lg"
          onClick={() => handleOptionClick("images")}>
            <Image className="w-6 h-6 mr-2" />
            Post con múltiples imágenes
          </Button>

          <Button 
             variant={selectedOpction ==="video" ? "default" : "outline"}
          className="flex items-center justify-start h-16 text-lg"
          onClick={() => handleOptionClick("video")}>

            <Film className="w-6 h-6 mr-2" />
            Post con video
          </Button>
          <Button 
            variant={selectedOpction ==="single-image" ? "default" : "outline"}
          className="flex items-center justify-start h-16 text-lg"
          onClick={() => handleOptionClick("single-image")}>

            <ImagePlus className="w-6 h-6 mr-2" />
            Post con una sola imagen
          </Button>
        </CardContent>
      
        <CardFooter>
          <Button className="w-full"
          onClick={handleNext}
          disabled={!selectedOpction}>

            Siguiente
            <ArrowRight className="w-4 h-4 ml-2" />
          </Button>
        </CardFooter>
      </Card>
      </>
    )

     }
    
export default Create;