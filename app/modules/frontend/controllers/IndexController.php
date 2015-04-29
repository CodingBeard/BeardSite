<?php

/**
 * Index controller, url: / | /index/
 *
 * @category
 * @package BeardSite
 * @author Tim Marshall <Tim@CodingBeard.com>
 * @copyright (c) 2015, Tim Marshall
 * @license New BSD License
 */

namespace frontend\controllers;

use CodingBeard\Emails\Groups\Contact;
use CodingBeard\Forms\Fields\Captcha;
use CodingBeard\Forms\Fields\Textarea;
use CodingBeard\Forms\Fields\Textbox;

class IndexController extends ControllerBase
{

    /**
     * Index page
     */
    public function indexAction()
    {
        $this->tag->appendTitle("Home");
        $form = $this->forms;

        $form->title = '';
        $form->description = '<div class="center">Want to know more? Leave me a comment and I\'ll get back to you.</div>';
        $form->cancelHref = '#page-top';

        $form
            ->addField(new Textbox([
                'key'      => 'name',
                'label'    => 'Your Name',
                'required' => true,
            ]))
            ->addField(new Textbox([
                'key'      => 'email',
                'label'    => 'Your Email',
                'required' => true,
            ]))
            ->addField(new Textarea([
                'key'      => 'message',
                'label'    => 'Your Message',
                'required' => true,
            ]))
            ->addField(new Captcha());

        if ($form->validate()) {
            $this->emails->queue(Contact::comment(
                $this->request->getPost('name', 'trim'),
                $this->request->getPost('email', 'trim'),
                $this->request->getPost('message', 'trim')
            ));

            return $this->auth->redirect('#contact', 'success', 'Thank you for your comment.');
        }
        $form->render();
    }

}
