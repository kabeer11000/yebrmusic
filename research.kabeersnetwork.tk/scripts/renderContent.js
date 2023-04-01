const Card = ({
                  title, body, image
              }) => {
    return `<div class="card" style="width: 100%;height: 100%">
  ${image ? `<img src="${image}" class="card-img-top" alt="...">` : ""}
  <div class="card-body">
    <h5 class="card-title">${title}</h5>
    <p class="card-text">${body}</p>
  </div>
</div>`
};
const Container = ({
                       content
                   }) => `<div class="container"><div class="row">${content}</div></div>`;
const Col = ({classes, content}) => `<div class="${classes ?? "col"}">${content}</div>`;

export const renderContent = async ({articles, container}) => {
    const cards = []
    for (const article of articles) cards.push(Col({
        classes: "col w-100 col-md-6 col-sm-12 col-lg-4", content: Card({
            title: article.heading, body: article.excerpt, image: article.image
        })
    }));
    return container.innerHTML = Container({content: cards.join("")});
}