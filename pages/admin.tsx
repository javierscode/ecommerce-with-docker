import { withAuth } from "../HOC/withAuth";



const Administration = () => {

    return (
        <div>
            <h1>Administration</h1>
            <p>This is the administration page</p>
        </div>
    );
}


export default withAuth(Administration);