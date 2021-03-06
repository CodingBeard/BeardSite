<?php

/**
 * Pages controller, url: /admin/pages/
 *
 * @category
 * @package BeardSite
 * @author Tim Marshall <Tim@CodingBeard.com>
 * @copyright (c) 2015, Tim Marshall
 * @license New BSD License
 */

namespace backend\controllers;

use CodingBeard\Forms\Fields\Aceditor;
use CodingBeard\Forms\Fields\Hidden;
use CodingBeard\Forms\Fields\Select;
use CodingBeard\Forms\Fields\Switchbox;
use CodingBeard\Forms\Fields\Textbox;
use models\Contents;
use models\Pages;

class PagesController extends ControllerBase
{

    /**
     * Display all pages
     */
    public function indexAction()
    {
        $this->tag->appendTitle("Pages");
        $this->view->pages = Pages::find();
    }

    /**
     * Create a new page
     */
    public function newAction()
    {
        $this->tag->appendTitle("New Page");

        $form = $this->forms;
        $form->title = 'New Page';
        $form->submitButton = 'Save';
        $form->cancelHref = 'admin/pages';

        $form
            ->addField(new Textbox([
                'key' => 'name',
                'label' => 'Name',
                'required' => true,
                'size' => 6
            ]))
            ->addField(new Textbox([
                'key' => 'title',
                'label' => 'Page Title',
                'required' => true,
                'size' => 6
            ]))
            ->addField(new Switchbox([
                'key' => 'standalone',
                'label' => 'Standalone page',
                'toggleRequired' => ['url'],
            ]))
            ->addField(new Textbox([
                'key' => 'url',
                'label' => 'Url',
                'required' => function () {
                    return ($this->request->getPost('standalone', 'trim') == 'on') ? true : false;
                },
            ]));

        if ($form->validate()) {
            $page = $form->addToModel(new Pages());

            if ($page->save()) {
                $this->auth->redirect('admin/pages', 'success', 'Page created.');
            }
        }
        $form->render();
    }

    /**
     * Edit a page
     * @param int $page_id
     */
    public function editAction($page_id)
    {
        $this->tag->appendTitle("Edit Page");
        $page = Pages::findFirstById($page_id);
        if (!$page) {
            $this->auth->redirect('admin/pages', 'error', 'Invalid Page ID.');
        }
        $form = $this->forms;
        $form->title = 'Edit Page: ' . $page->name;
        $form->submitButton = 'Save';
        $form->cancelHref = 'admin/pages';

        $form
            ->addField(new Textbox([
                'key' => 'name',
                'label' => 'Name',
                'required' => true,
                'default' => $page->name,
                'size' => 6
            ]))
            ->addField(new Textbox([
                'key' => 'title',
                'label' => 'Page Title',
                'required' => true,
                'default' => $page->title,
                'size' => 6
            ]))
            ->addField(new Switchbox([
                'key' => 'standalone',
                'label' => 'Standalone page',
                'toggleRequired' => ['url'],
                'default' => $page->standalone,
            ]))
            ->addField(new Textbox([
                'key' => 'url',
                'label' => 'Url',
                'default' => $page->url,
                'required' => function () use ($page) {
                    if ($this->request->isPost()) {
                        return ($this->request->getPost('standalone', 'trim') == 'on') ? true : false;
                    }
                    return $page->standalone;
                },
            ]));

        if ($form->validate()) {
            $page = $form->addToModel($page);

            if ($page->save()) {
                $this->auth->redirect('admin/pages', 'success', 'Page updated.');
            }
        }
        $form->render();
    }

    /**
     * Manage a page
     * @param int $page_id
     */
    public function manageAction($page_id)
    {
        $this->view->getViewsDir();
        $this->tag->appendTitle("Manage Page");
        $page = Pages::findFirstById($page_id);
        if (!$page) {
            $this->auth->redirect('admin/pages', 'error', 'Invalid Page ID.');
        }
        $this->view->page = $page;
        $form = $this->forms;
        $form->title = '';
        $form->submitButton = 'Add to ID: <span class="selected-section">0</span>';
        $form->cancelHref = 'admin/pages';

        $form
            ->addField(
                new Select([
                    'key' => 'offset',
                    'label' => 'Left Offset',
                    'class' => 'browser-default',
                    'options' => function () {
                        $options = [];
                        foreach (range(0, 12) as $value) {
                            $options[] = ['value' => $value, 'label' => $value, 'default' => false];
                        }
                        return $options;
                    },
                    'size' => 6
                ]))
            ->addField(
                new Select([
                    'key' => 'width',
                    'label' => 'Width',
                    'class' => 'browser-default',
                    'options' => function () {
                        $options = [];
                        foreach (range(12, 1) as $value) {
                            $options[] = ['value' => $value, 'label' => $value, 'default' => false];
                        }
                        return $options;
                    },
                    'size' => 6
                ]))
            ->addField(new Hidden(['key' => 'parent_id', 'default' => null]));

        if ($form->validate()) {
            $content = $form->addToModel(new Contents());
            $content->page_id = $page->id;
            $content->content = 'Edit Me';
            $content->save();
            $this->auth->redirect('admin/pages/manage/' . $page->id, 'success', 'Section Added.');
        }
        $form->render();
    }

    /**
     * Reorder the contents of a page (via ajax)
     * @param int $page_id
     */
    public function reorderAction($page_id)
    {
        $page = Pages::findFirstById($page_id);
        if ($page) {
            foreach ($this->request->getPost('ordering') as $order => $content_id) {
                $content = Contents::findFirstById($content_id);
                if ($content) {
                    $content->ordering = $order;
                    $content->save();
                }
            }
        }
    }

    /**
     * Remove the parent_id from a piece of content
     * @param int $content_id
     */
    public function movecontentAction($content_id, $parent_id)
    {
        $content = Contents::findFirstById($content_id);
        if ($content) {
            $parent = Contents::findFirstById($parent_id);
            if (!$parent) {
                $parent_id = null;
            }
            if ($parent->parent_id != $content->id) {
                $content->parent_id = $parent_id;
                $content->save();
                $this->auth->redirect('admin/pages/manage/' . $content->pages->id, 'success', "Section ID: {$content->id} Moved to ID: {$parent->id}.");
            }
            else {
                $this->auth->redirect('admin/pages/manage/' . $content->pages->id, 'error', "You cannot move a parent into one of it's own children.");
            }
        }
    }

    /**
     * Edit contents
     * @param int $content_id
     */
    public function contentAction($content_id)
    {
        $this->tag->appendTitle("Edit Content");
        $content = Contents::findFirstById($content_id);
        if (!$content) {
            $this->auth->redirect('admin/pages', 'error', 'Invalid Page ID.');
        }
        $this->view->contents = $content;

        $form = $this->forms;
        $form->title = 'Edit Content: #' . $content->id;
        $form->submitButton = 'Save';
        $form->cancelHref = 'admin/pages/manage/' . $content->pages->id;

        $form
            ->addField(new Aceditor([
                'key' => 'content',
                'label' => 'Content',
                'default' => $content->content
            ]));

        if ($this->request->isAjax()) {
            $content = $form->addToModel($content);
            if ($content->save()) {
                echo json_encode(['status' => 1, 'redirect' => '/admin/pages/manage/' . $content->pages->id]);
                die;
            }
        }
        $form->render();
    }

    /**
     * Delete a content
     * @param int $content_id
     */
    public function deletecontentAction($content_id)
    {
        $content = Contents::findFirstById($content_id);
        if (!$content) {
            return $this->auth->redirect('admin/pages', 'error', 'Invalid Page ID.');
        }
        $page = $content->pages;
        $content->delete();
        $this->auth->redirect('admin/pages/manage/' . $page->id, 'success', 'Section Deleted.');
    }

}
