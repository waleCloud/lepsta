import { Router } from 'express';
import helloController from '../controllers/helloController';
import authController from '../controllers/authController';

const router = Router();

router.get('/hello', helloController.index);
router.get('/lepsta', helloController.lepsta);
router.post('/login', authController.login);
router.get('/logout', authController.logout);

export default router;
