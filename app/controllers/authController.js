class authController {
  
  static login (req, res) {
    return (
      res.status(200).json({
        status: 'success',
        message: 'Login Successfully',
        data: {
          passsword: req.body.password,
          email: req.body.email,
        },
      })
    );
  }

  static logout (req, res) {
    return (
      res.status(200).json({
        status: 'success',
        message: 'Logout',
        data: {},
      })
    );
  }

}

export default authController;
