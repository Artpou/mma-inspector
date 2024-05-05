export const poundToKg = (pounds: number) => {
  const kg = pounds * 0.453592;
  return kg.toFixed(0);
};

export const inchesToCm = (inches: number) => {
  return (inches * 2.54).toFixed(0);
};

export const inchesToFeet = (inches: number) => {
  const feet = Math.floor(inches / 12);
  const remainingInches = inches % 12;
  return `${feet}'${remainingInches}"`;
};
