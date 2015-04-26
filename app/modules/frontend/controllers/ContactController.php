<?php

/**
 * Contact controller, url: / | /index/
 *
 * @category
 * @package BeardSite
 * @author Tim Marshall <Tim@CodingBeard.com>
 * @copyright (c) 2015, Tim Marshall
 * @license New BSD License
 */

namespace frontend\controllers;

use CodingBeard\Emails\Groups\Contact;
use CodingBeard\Forms\Fields\Textarea;
use CodingBeard\Forms\Fields\Textbox;

class ContactController extends ControllerBase
{
    /**
     * Index page
     */
    public function indexAction()
    {
        $this->tag->appendTitle("Contact");

        $form = $this->forms;

        $form->title = 'Leave a comment';

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
            ]));

        if ($form->validate()) {
            $this->emails->queue(Contact::comment(
                $this->request->getPost('name', 'trim'),
                $this->request->getPost('email', 'trim'),
                $this->request->getPost('message', 'trim')
            ));
            return $this->auth->redirect('', 'success', 'Thank you for your comment.');
        }
        $form->render();
    }

}
