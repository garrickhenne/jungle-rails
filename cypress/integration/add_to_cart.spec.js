describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('Should increase cart by one when adding item to cart', () => {
    cy.get('[href="/cart"]').should('contain.text', 0);

    cy.get('article').find('[href="/products/2"]').parent()
      .find('button.btn')
      .click({ force: true });

    cy.get('[href="/cart"]').should('contain.text', 1);
  });
});