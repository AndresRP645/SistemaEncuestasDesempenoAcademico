const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const { crypt, match } = require('../lib/helpers');


passport.use('login', new LocalStrategy({
    usernameField: 'No_cuenta',
    passwordField: 'No_cuenta',
    passReqToCallback: true
}, async (req, username, password, done) => {
    const rows = await pool.query("select * from alumnos where No_Cuenta = " + username);
    const user = rows[0];
    if (rows.length > 0) {
        const ban = await match(password, user.password);
        if (ban) {
            req.session.id = user.id;
            done(null, user, req.flash('success', 'Favor de resporder el siguiente cuestionario'));
        } else {
            console.log('error 1');
            done(null, false, req.flash('message', 'Ocurrió un error al ingresar'));
        }
    } else {
        console.log('error 2');
        done(null, false, req.flash('message', 'Ocurrió un error al ingresar'));
    }
}));

passport.use('signup', new LocalStrategy({
    usernameField: 'No_cuenta',
    passwordField: 'No_cuenta',
    passReqToCallback: true

}, async (req, username, password, done) => {
    const { Nombre_Completo } = req.body;
    const newUser = {
        No_Cuenta: username,
        password,
        Nombre_Completo
    };

    const rows = await pool.query("select * from alumnos where No_Cuenta = " + username);

    if (rows.length > 0) {
        return done(null, false, req.flash('message', 'Ya existe un usuario registrado con ese número de cuenta \n si existe algun problema hablar con el administrador del servidor'));
    }
    else {
        newUser.password = await crypt(password);
        const result = await pool.query('INSERT INTO alumnos SET ?', [newUser]);
        newUser.id = result.insertId;
        req.session.id = newUser.id;
        return done(null, newUser, req.flash('success', 'Favor de resporder el siguiente cuestionario'));
    }
}));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(function (id, done) {
    pool.query("select * from alumnos where id = " + id, function (err, rows) {
        done(err, rows[0]);
    });
});
