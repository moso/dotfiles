import moso from '@moso/eslint-config';

export default moso(
    {
        typescript: {
            tsconfigPath: './tsconfig.json',
        },
    },
);
