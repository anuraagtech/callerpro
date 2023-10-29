<?php
  
namespace App\Enums;
use Filament\Support\Contracts\HasLabel;
 
enum UserType: string implements HasLabel
{
    case Admin = '1';
    case SubAdmin = '2';
    case Caller = '3';
    
    public function getLabel(): ?string
    {
        // return $this->name;
        
        // or
    
        return match ($this) {
            self::Admin => 'Admin',
            self::SubAdmin => 'SubAdmin',
            self::Caller => 'Caller',
        };
    }
}